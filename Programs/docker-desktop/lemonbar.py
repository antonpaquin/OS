#! /bin/python3
import threading
import re
import time

sysinfo='/root/sysinfo'

lbuf = '   '
rbuf = '   '

bspwm_obuf = '  '
bspwm_ibuf = ' '
bspwm_bgcolor = '#181818'

def color(inner, color):
    return '%{{B{}}}{}%{{B-}}'.format(color, inner)

def wrap(inner, outer):
    return '{}{}{}'.format(outer, inner, outer)

################################################################################

def left():
    return ''

################################################################################

def center():
    return '{}'.format(format_bspwm())

def format_bspwm():
    currentDesk = data['bspwm_desktops']
    windows = data['bspwm_windows']
    return bspwm_obuf.join([color(win_b, bspwm_bgcolor) for win_b in [wrap(win_a, bspwm_ibuf) for win_a in windows]])

################################################################################

def right():
    return '{} | {}'.format(format_date(), format_acpi())

def format_date():
    d = data['date']
    return '{} {} {} | {}:{}'.format(d['dow'], d['month'], d['dom'], d['hour'], d['minute'])

def format_acpi():
    return '{}%'.format(data['acpi'])

################################################################################

def show():
    global lock
    lock=False
    #print('%{{l}}{}{}%{{c}}{}%{{r}}{}{}'.format(lbuf, left(), center(), right(), rbuf))

################################################################################

components = ['acpi','date','bspwm_windows','bspwm_desktops']
data = {}

data['acpi'] = 'xx'
def acpi(line):
    try:
        return re.search('[0-9]+(?=%)',line).group(0)
    except Exception:
        return 'xx'

data['date'] = {'dow':'','month':'','dom':'','hour':'xx','minute':'xx'}
def date(line):
    r = line.split(',')
    return {
        'dow':r[0],
        'month':r[1],
        'dom':r[2],
        'hour':r[3],
        'minute':r[4].strip()
        }

data['bspwm_windows'] = 'Initializing lemonbar...'
def bspwm_windows(line):
    return [win.strip() for win in line.split(',')[1:]]

data['bspwm_desktops'] = 1
def bspwm_desktops(line):
    return int(line)

def zwrap(comp):
    targetf = globals()[comp]
    def f():
        file = open('/root/sysinfo/' + comp,'r')
        while(True):
            line = file.readline()
            if line != '':
                data[comp] = targetf(line)
                show()
            time.sleep(0.5)
    return f

for f in components:
    threading.Thread(target=zwrap(f)).start()

global lock
lock = False
while(True):
    pass
    while(lock):
       time.sleep(0.2)
    print('%{{l}}{}{}%{{c}}{}%{{r}}{}{}'.format(lbuf, left(), center(), right(), rbuf))
    lock = True
