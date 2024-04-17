# Clean all packages
echo "Clean all local packages"
for dir in local_packages/*
do
  cd $dir
  echo "Cleaning $dir"
  flutter clean
  cd -
done
echo "Clean all packages"
for dir in packages/*
do
  cd $dir
  echo "Cleaning $dir"
  flutter clean
  cd -
done
echo "Cleaning main"
flutter clean
echo "Cleaning ios specific elements"
rm -Rf ./ios/Pods
rm -Rf ./ios/Podfile.lock
echo "Finished clean all packages"