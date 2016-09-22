#! /bin/python3
import threading
import re
import time

sysinfo='/root/sysinfo'

lbuf = '   '
rbuf = '   '

bspwm_obuf = '  '
bspwm_ibuf = ' '
bspwm_bgcolor = '#1a1e20'
bspwm_hlcolor = '#6287A2'

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
    windows = [wrap(win, bspwm_ibuf) for win in windows]
    for i in range(len(windows)):
        if i==currentDesk-1:
            windows[i] = color(windows[i], bspwm_hlcolor)
        else:
            windows[i] = color(windows[i], bspwm_bgcolor)
    return bspwm_obuf.join(windows)

################################################################################

def right():
    return '{} | {}'.format(format_date(), format_acpi())

def format_date():
    d = data['date']
    return '{} {} {} | {}:{}'.format(d['dow'], d['month'], d['dom'], d['hour'], d['minute'])

def format_acpi():
    return '{}%'.format(data['acpi'])

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
            else:
                time.sleep(0.2)
    return f

for f in components:
    threading.Thread(target=zwrap(f)).start()

while(True):
    time.sleep(0.2)
    print('%{{l}}{}{}%{{c}}{}%{{r}}{}{}'.format(lbuf, left(), center(), right(), rbuf))
