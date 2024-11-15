mkdir -pv /{etc,var,dev,proc,sys,run} /usr/{bin,lib,sbin,lib64}

for i in bin lib sbin; do
  ln -sv usr/$i /$i
done
