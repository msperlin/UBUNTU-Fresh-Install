#!/usr/bin/env bash

# populates gitrepo directory 
# make sure you have ssh registered at github

USERNAME="msperlin"
name_main_dir="GitRepo"
echo "Populating gitrepo folder"


cd /home/$USERNAME/

mkdir $name_main_dir
cd $name_main_dir

# clone r pkgs
name_dir="01-r-pkgs"
my_repos=( "GetDFPData2" "vdr" "GetFREData" "classtools" )

mkdir $name_dir
cd $name_dir

for i_repo in "${my_repos[@]}"
do
	git clone git@github.com:msperlin/$i_repo.git
done

# other pgks
git clone git@github.com:ropensci/yfR.git

cd ..
# books
name_dir="02-books"

my_repos=( "chapter-dataviz-saude.gov" )

mkdir $name_dir
cd $name_dir

for i_repo in "${my_repos[@]}"
do
	git clone git@github.com:msperlin/$i_repo.git
done

cd ..

# sites
name_dir="03-sites"

my_repos=( "msperlin-blog" )

mkdir $name_dir
cd $name_dir

for i_repo in "${my_repos[@]}"
do
	git clone git@github.com:msperlin/$i_repo.git
done

cd ..

# others
name_dir="04-others"

my_repos=( "UBUNTU-Fresh-Install" )

mkdir $name_dir
cd $name_dir

for i_repo in "${my_repos[@]}"
do
	git clone git@github.com:msperlin/$i_repo.git
done

cd ..
