
if [ $# == 0 ]; then
	devs="`adb devices | awk '{if(NF>0)print $0}' | sed -n '2,$p'`"
	N=`echo $devs | wc -l`
	if [ $N -gt 1 ]; then
		echo "Usage: $0 device-serial" >&2
		adb devices
		exit 1
	fi
	set -- `echo "$devs" | awk '{print $1}'`
fi

set -x

adb -s $1 root
adb -s $1 shell setenforce 0
adb -s $1 shell mount -o remount,rw /
adb -s $1 push $HOME/bin/busybox /sbin

# on 64-bit system, it fails
if [ $? != 0 ]; then
	adb -s $1 shell mount -o rw,exec,remount /mnt
	adb -s $1 shell cp -rfp '/sbin' /mnt/
	adb -s $1 shell mount /mnt/sbin /sbin
	adb -s $1 push $HOME/bin/busybox /sbin
fi

adb -s $1 shell /sbin/busybox --install -s /sbin
res=$?

set +x
if [ $res == 0 ]; then
	echo Successful
else
	echo Failed
fi
