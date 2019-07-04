from datetime import datetime as D
import locale
import notify2
import time
locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')  # Customize

def GetMessage():
	return_msg = []
	# Life expectancy is 68 years
	diff = (D(2057, 1, 1) - D.today())
	seconds = int(diff.total_seconds())
	return_msg.append('Go for walk. Stretch.')
	return_msg.append('Drink water.')
	return_msg.append('Deep breath.')
	return_msg.append('Update the logs.')
	return_msg.append('{:,} seconds'.format(seconds))
	return_msg.append('{:,} mins'.format(seconds / 60))
	return_msg.append('{:,} hours'.format(seconds / 3600))
	return_msg.append('{:,} days'.format(diff.days))
	return_msg.append('{:,} weeks'.format(diff.days / 7))
	return "\n".join(return_msg)

notify2.init('time_notification')
n = notify2.Notification("Notification",
                         "message",
                         "notification-message-im"   # Icon name
                        )
n.set_urgency(notify2.URGENCY_CRITICAL)
n.set_timeout(1000 * 60 * 15)

while True:
	message = GetMessage()
	n.update("Notification",
		message,
		"notification-message-im"   # Icon name
		)
	n.show()
	# Sleep for 30 minutes
	time.sleep(60*30)
