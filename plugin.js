

config = ipwebcam.load_config({timeout: 10, use_af: false})

takePhoto = function() {
	if (config.use_af) {
		ipwebcam.uiAction("take_photo_af")
	} else {
		ipwebcam.uiAction("take_photo")
	}
	reschedulePhoto()
}

reschedulePhoto = function() {
	ipwebcam.setTimeout(takePhoto, config.timeout * 1000)
}

ipwebcam.setTimeout(function() {
	reschedulePhoto()
}, 3000)

