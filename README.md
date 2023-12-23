# zip vs gzip

Create 5 ASCII encoded text files in subjects folder.
```
./make_ascii_files.py
```

Creates a zip folder and compresses the subject files with zip.
```
./zip_subjects.sh
```

Same as zip_subjects but with gzip.
```
./gzip_subjects.sh
```

Run `stat` on all files and formats output.
```
./test.sh
```

or just run `lazy.sh`


## Subject files

Following files are all downloaded from https://file-examples.com/

* subjects/file_example_AVI_640_800kB.avi
* subjects/file_example_JPG_500kB.jpg
* subjects/file_example_PNG_500kB.png