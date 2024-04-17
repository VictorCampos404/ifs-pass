# Get all packages
echo "Get in all local packages$"
for dir in local_packages/*
do
  flutter packages get $dir
done
echo "Get in all packages$"
for dir in packages/*
do
  flutter packages get $dir
done
flutter packages get
echo "Finished get packages$"