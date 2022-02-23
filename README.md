# ODAD guide to start a new project

## First of all...

Do you have the environment variables `DATA_PATH` and `CODE_PATH` defined? If so, go to the next section. If not, you must set up them.


* Run `usethis::edit_r_environ()` in the console.
* Modify the file adding this lines at the end
```
        DATA_PATH="absolute path to Onedrive DATA folder."
        CODE_PATH="path to your code."
```
* IMPORTANT!!! When R starts it searches for `.Renviron` in the `$HOME` directory or in the current working directory (often the directory of the project) and only executes one. If you want to have a project-side `.Renviron` you have to add the line
```
readRenviron("~/.Renviron")
```
at the top of the user `.Rprofile` file (Running `usethis::edit_r_profile()`) to make sure that the user `.Renviron` is also executed.
* Restart R for changes to take effect.


## Starting a new project

### Bitbucket 

* Go to Bitbucket and create a new repository. Let's saye you name it `proj_name`.
    * In the "project" dialogue selection select okuant.
Note: in this case, project means "group", all our repositories/projects are under that group.
    * Make sure it's created *without* a README.md and *without* a .gitignore.
* Create directory's project,  `mkdir proj_name && cd proj_name`.
* Clone this template with
```
git clone https://your_user_name@bitbucket.org/okuanters/template.git .
```
Don't forget the final dot. You can use the clone button to get directly the url with your user name.

* Run the following code after cloning. Don't forget to change `proj_name`.
```
git remote remove origin
git remote add origin https://your_user_name@bitbucket.org/okuanters/proj_name.git
git push -u origin master
```

### Github

* Go to Github and create a new repository. Let's saye you name it `proj_name`.
    * In the "Owner" dialogue selection select okuant.
    * Select Private
    * Make sure it's created *without* a README.md and *without* a .gitignore.
    * In the project settings page go to *Notifications* and set **Adress** as data.analytics@okuant.com and **Approved header** as `proj_name` then press **Setup notifications**
* Create directory's project,  `mkdir proj_name && cd proj_name`.
* Clone this template with
```
git clone git@github.com:okuant/template.git .
```
Don't forget the final dot. You can use the clone button to get directly the url with your user name.

* Run the following code after cloning. Don't forget to change `proj_name`.
```
git remote remove origin
git remote add origin git@github.com:okuant/proj_name.git
git push -u origin master
```

### Common steps 

* Reload your project's repo web to check everything's fine.
* Rename rproj file `mv template.Rproj proj_name.Rproj`
* Commit change
```
git add --all
git commit -m "Rename template.rproj"
git push origin master
```
* Open your new `proj_name.rproj` in RStudio. Optionally, check again the repo in bitbucket.
* Edit README. Add a thorough description of what your project is about, what needs to run
(data, libraries) and what are the outputs that produces. Don't miss this step. Or else.

## The `init.R` script

This piece of code is intended to be run once when you've set up your project.
It populates the data structure of the project, creating physical directories in your DATA_path and
symlinks in the local dir.
`source` it after you've adapted the config files to your required data.

Known synch problem: with OneDrive you may have to source the script twice if you have the space saving setting enabled.
In that case, the first source will download the data, but you'll get an error when trying to create the symlinks.
The second source should make things right.

## Notes
Some `.gitignore` files inside every subdirectory are intentionally left empty.
The reason to their existency is to keep the directory hierarchy, since git doesn't allow to commit empty dirs.
Symlinks are supposed to be ignored.
Please, make sure all `.gitignore` files in each new directory you create in your own repository cloned from this template have the corresponding instructions.

## On saving your code:
Do commit to your project repository often and keep it updated with the remote.
[READ THIS](https://bitbucket.org/okuanters/template/src/master/commits_syle_guide.md)
