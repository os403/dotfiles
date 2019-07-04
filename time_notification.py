from datetime import datetime as D
import locale
locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')  # Customize

# Life expectancy is 68 years
diff = (D(2057, 1, 1) - D.today())
seconds = int(diff.total_seconds())
print('Go for walk. Stretch.')
print('Drink water.')
print('Deep breath.')
print('Update the logs.')
print('{:,} seconds'.format(seconds))
print('{:,} mins'.format(seconds / 60))
print('{:,} hours'.format(seconds / 3600))
print('{:,} days'.format(diff.days))
print('{:,} weeks'.format(diff.days / 7))
