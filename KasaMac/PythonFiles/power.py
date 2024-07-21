import subprocess


def currPercent() -> int:
   cmd = 'pmset -g batt | grep -Eo "\d+%" | cut -d% -f1'
   ps = subprocess.Popen(
      cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
   output = ps.communicate()[0]
   str_output = str(output, encoding='utf-8')
   percent = int(str_output)
   print(percent)
   return percent


def currCharging() -> bool:
   cmd = 'pmset -g batt | head -n 1 | cut -c19- | rev | cut -c 2- | rev'
   ps = subprocess.Popen(
      cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
   output = ps.communicate()[0]
   curr_state = str(output, encoding='utf-8')
   return curr_state == "AC Power\n"
