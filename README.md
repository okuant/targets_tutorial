# ODAD guide to start a new project

## Starting a new project

* Go to Bitbucket and create a new repository. Let's saye you name it `proj_name`.
    * In the "project" dialogue selection select okuant.
Note: in this case, project means "group", all our repositories/projects are under that group.
    * Make sure it's created *without* a README.md
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
* Reload your project's repo web to check everything's fine.
* Edit README.

## Notes
The `.gitignore` files inside every subdirectory are intentionally left empty.
The reason to their existency is to keep the directory hierarchy, since git doesn't allow to commit empty dirs.