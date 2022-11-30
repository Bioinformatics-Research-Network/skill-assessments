# Linux CLI (Bash / Shell) for Bioinformatics

**Note**: This training will require setting up a free AWS account, which requires a credit card that can do business in the U.S. (you won't be charged though). If you do not have a card like this and cannot get one, let Henry know and he will help you.

## Introduction

This training is designed to test your basic fluency in the Linux environment and your ability to utilize google to complete challenges on the command line. It also has the added bonus of giving you a glimpse into the wide world of AWS. Please follow all instructions. Wherever you are asked to answer a question, answer it in a separate markdown file called `answers.md`. You will need to send your answers to Henry in order to complete this training. 

For example, if I asked:
>Q1. In the command `ls`, what do `l` and `s` stand for?

This would be what I expect to see in `answers.md`:

>Q1: In the command `ls`, what do `l` and `s` stand for?  
A: `ls` stands for "**l**ist **s**torage"

See an example in `answer_example.md` within this directory.

## Preliminary - complete a Linux course
Before you begin this, you should already have completed a basic Linux course / tutorial such as:

- Introduction to Shell ([DataCamp](https://learn.datacamp.com/courses/introduction-to-shell))
- YouTube Shell Tutorial ([here](https://www.youtube.com/watch?v=oxuRxtrO2Ag))

Also, don't forget about the Linux CLI cheatsheets (e.g., [this](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)).

## Create a free Linux server in AWS

AWS is a cloud provider which allows users to create small linux servers for free. Create an AWS account and follow their [tutorial](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-launch-instance) to set up a linux server (you don't need to change the default security group settings). **Note**: Select the  `Ubuntu Server 20.04 LTS` image. Make sure that you select the `t2.micro` instance type. Leave all other settings as default. 

**NOTE** DO NOT PAY FOR ANYTHING -- there's no need to use paid services in this training. Ensure everything you use is "free tier eligible". 

## Connect to your linux instance using ssh and SFTP

Secure Shell (ssh) is a protocol for encrypted communication between computers over the internet. It uses a client-server model in which remote machines are "servers" and your local machine is the "client". For example, you can use your laptop (ssh client) to connect to a linux machine on AWS (ssh server). Once the connection is established, it is easy to operate the remote machine using the linux command line interface (CLI).

Secure File Transfer Protocol (SFTP) is a protocol for encrypted file transfers between computers over the internet. It uses a similar model to ssh except that, instead of issuing CLI commands, it allows clients to upload and download files between their computer and the server. 

**NOTE**: For any of the methods below, you can connect to the `Public IPv4 address` or the `Public IPv4 DNS` listed in the EC2 instance page for your server. The username will be `ubuntu` and you need the private key (`.pem`) file that was provided by AWS in order to connect.

### Connect to the EC2 (Windows-version)

Please choose one of the following methods for connecting to your EC2 instance:

#### MobaXTerm (ssh and SFTP)

You're in luck! Windows is actually the best OS for connecting to remote linux servers because of [MobaXTerm](https://mobaxterm.mobatek.net/). MobaXTerm has tabbed ssh sessions, a built-in SFTP panel, remote text editing, and so much more -- and it's free! [Here](https://www.devopshint.com/how-to-connect-to-aws-ec2-instance-using-mobaxterm/) is a very brief tutorial on how to connect to AWS EC2 using MobaXTerm. 

**June 2022 note**: some users are experiencing an issue using their private key (.pem file) to log into their EC2 instance with MobaXTerm (Error message: "Server refused our key"). While this usually means you are using the wrong key or wrong username (see this troubleshooting guide: [link](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-server-refused-our-key/)), it might still happen when you are using the correct key and username. In that case, [this solution](https://superuser.com/a/1679777/1239769) should fix the problem. It requires that you login using a command-line connection string like this: `ssh -i "your_key.pem" ubuntu@your_ec2_url.com` -- and then changing the settings in `/etc/ssh/sshd_config` using a text editor such as *vim* or *nano*. If you are still having issues after trying this, please contact Henry and he will assist you.

#### PuTTY (ssh)

PuTTY is a popular ssh client on Windows and you can find a tutorial for connecting to an AWS EC2 instance from PuTTY [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html). 

#### WSL (ssh)

The Windows Subsystem for Linux (WSL) is a very useful tool for any Windows-based developer to know about. It also has a built-in ssh client which you can use for connecting to your linux server. Learn how to set up WSL [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Learn how to connect to your linux EC2 instance [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/WSL.html).

### Connect to the EC2 (MacOS-version)

Please choose one of the following methods for connecting to your EC2 instance:

#### Terminal

The method preferred by many MacOS developers is simply to use the built-in `terminal`. [Here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html) is the relevant section of the AWS tutorial -- the MacOS terminal should have an ssh client built in which you can use. 

### SFTP (both Windows and MacOS)

Please use the following methods to establish an SFTP connection with your EC2 instance (**NOTE**: MobaXTerm users will not need to complete this part): 

#### FileZilla (SFTP)

[FileZilla](https://filezilla-project.org/) is an excellent, free FTP client which you can use for SFTP connections to remote machines. [Here](https://docs.aws.amazon.com/transfer/latest/userguide/transfer-file.html) is a tutorial which includes a section about using FileZilla for connecting to AWS EC2 instances. 

#### Alternatives to FileZilla (SFTP)

There's plenty of decent alternatives to FileZilla, such as [Cyberduck](https://cyberduck.io/) that you may also want to try. The AWS [tutorial](https://docs.aws.amazon.com/transfer/latest/userguide/transfer-file.html) lists several alternatives and provides instructions for establishing an SFTP connection from them.

#### VSCode for SFTP (Credit to Roshan for suggesting this)

[VSCode](https://code.visualstudio.com/) is an excellent IDE for coding in a variety of languages and environments. Additionally, VSCode can connect to remote servers, allowing you to edit and transfer files over SFTP. To learn more, see the guide [here](https://code.visualstudio.com/docs/remote/ssh-tutorial). 

## Orientation to Linux Files and Navigation

Once you have successfully connected, complete the following steps:

1. To print "Hello world!" run `echo Hello world!`. 
2. Use `pwd` to determine your current working directory. Note that when you first log in, you will always start out in your "home directory". **Q1. What is your home directory?** 
3. Create a new directory called `my_folder/`
4. Use SFTP to upload the file `hello_world.txt` (in this repo) to the `my_folder/` directory.
5. Change to the `my_folder/` directory and then type `ls`. **Q2. What is the output of this command?**
6. Return to your home directory. Make a new directory called `my_folder2/`. 
7. Copy `my_folder/hello_world.txt` to your new directory.
8. Delete `my_folder/hello_world.txt` and then list the contents of `my_folder` and `my_folder2` with `ls`. **Q3. What is the output of each `ls` command?**
9. Make another new directory `my_folder3`. Move `hello_world.txt` from `my_folder2/` to `my_folder3/`. 
10. List the contents of `my_folder/`, `my_folder2/`, and `my_folder3`. **Q4. What is the output of each?**
11. Print the contents of `hello_world.txt` using `cat`. You should see `Hello world!`

## Scripting in the CLI

While fancy GUI-based editors like RStudio and VSCode are the best tools for most of your coding needs, there will be times when you need to write code, edit configs, and modify text files on remote servers where no GUI-based editor exists. While there are several strategies to get a GUI editor on a remote server (such as `jupyter-hub`, `rstudio-server`, or simply using `X11` forwarding), the most versitile and popular approach is to use a CLI-based text editor like `vim` or `nano`. 

Using `nano` (recommended), `emacs`, `vi`, or `vim`, complete the following:

1. Open `hello_world.txt`
2. Change `world` to `Linux`.
3. Save your changes to the file. **Q5. What editor did you use and what was the command to save your file changes?**
4. Run `cat` on your modified file. The output should be `Hello Linux!`.

## Set up a protected sudoer account and connect with it

While using the default `ubuntu` account is convenient, it also creates severe security issues. Anyone who holds your key (`.pem` file) has total control over your server. That's why it is good practice to make a secure admin account which has password-protected `sudo` capabilities. 

Complete the following:

1. Using `sudo adduser`, create a new user called `sudouser`. 
2. Set a strong, unique password for `sudouser` (I personally use [last pass](https://www.lastpass.com/password-generator)) and complete the rest of the setup using the defaults. After this step, you should see the directory `/home/sudouser/` has been created.
3. Use the `sudo usermod` command to give `sudouser` the ability to use the `sudo` command. 
4. Switch to the `sudouser` account with `su - sudouser`. You should now see `sudouser@ip-xxx-xx-xx-xxx:~$` at beginning of each line. This indicates you are now logged in as `sudouser`. 
5. Run `sudo ls /root` to confirm that `sudo` is working -- you should see it output the word `snap`.
6. Finally, close your `ssh` client. Re-open it and then connect again with the username `sudouser` but with ALL other connection settings the same as before. This should lead to an error. **Q6. What is the error?** Solve the issue.  **Q7. What was the solution?** To complete this training, you have to log in as `sudouser` and correctly explain what went wrong (see hints 1 and 2 below). There is no reason to switch to a different `ssh` client. MobaXTerm, WSL, PuTTY, and Terminal all work fine for this. (Also, if you didn't get an error when logging in as `sudouser`, let Henry know...)
7. Once you finally log in with `sudouser`, confirm again that you have `sudo` access by running `sudo ls /root`.
8. If you are certain that your `sudouser` login is working correctly, delete the `ubuntu` account with the `deluser` command. You should now be unable to log in as `ubuntu`.

**Hint 1**: Use your google skills, don't be afraid of watching/reading an ssh tutorial ([for example](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)), and remember that, whenever you learn new computing skills, most of the errors are either because you don't yet understand how the tools work or because you typed something incorrectly. 

**Hint 2**: There are two problems, both related to how you log in. The first problem is solved by changing the connections settings in your `ssh` client (if using MobaXTerm / PuTTY) or changing your connection command (if you are using WSL/Terminal). The second problem is more difficult and there are two main solutions to it. One of them involves changing how users log in (this is a bad solution for security reasons). The other will require generating a key that `sudouser` can use to log in. 

## Docker

Log in as `sudouser`. Now that you are on a password-protected `sudo` account, it's time to start setting up your system. One of your first tasks will be to update the system and then install Docker. Docker is an excellent tool for managing software using 'containers'. Learn more about getting started with Docker [here](https://docs.docker.com/get-started/). For now, complete the following:

1. Update the system by running the following:
```shell
sudo apt-get update
sudo apt-get upgrade
```
2. Complete the steps in the Docker [guide](https://docs.docker.com/engine/install/ubuntu/) to install docker.
3. Run the following to confirm it is working:
```shell
sudo docker run hello-world
```
4. Pull the docker image for the `salmon` pseudomapper ([about](https://salmon.readthedocs.io/en/latest/salmon.html)).
```shell
sudo docker pull combinelab/salmon
```
5. Confirm that `salmon` is working by running the following:
```shell
sudo docker run combinelab/salmon salmon swim
```
6. Regarding the previous command, **Q8. what does the `sudo docker run` part of the command do? and what does the `salmon swim` part of the command do?** Read the docs for docker and run `salmon -h` for more info. The output for `salmon swim` should look like this:
```shell
Version Info: This is the most recent version of salmon.

    _____       __
   / ___/____ _/ /___ ___  ____  ____
   \__ \/ __ `/ / __ `__ \/ __ \/ __ \
  ___/ / /_/ / / / / / / / /_/ / / / /
 /____/\__,_/_/_/ /_/ /_/\____/_/ /_/

```

7. Now that you're done, free up space by removing unused docker images.
```shell
sudo docker system prune -a
```

## Set up a non-sudo user account

While `sudo` access is convenient for when you need to install / update software system-wide, you can't always count on having it. In fact, it's safer to limit the number of users with `sudo` access, so most systems will only have a few of them. The rest of the users will be non-`sudo`. Complete the following to set up a non-`sudo` account:

1. Create a new user account, `serveruser`, that has a strong and randomly-generated password, a home directory, and the ability to access the server **without a private key file**.
2. Successfully connect to the server using `serveruser`.
3. Try running `sudo ls /root`, **Q9. What is the output of this command?**

**Complete all the following steps with the `serveruser` account**.

## Mamba

[Mamba](https://mamba.readthedocs.io/en/latest/) is a package management tool for data science and bioinformatics. It is based on the popular [conda](https://docs.conda.io/en/latest/) package manager, but it is much faster and uses less RAM. It also allows users to install software without `sudo` access, making it useful for a variety of linux environments. 

As `serveruser`, complete the following:
1. Download [mambaforge](https://github.com/conda-forge/miniforge#mambaforge) (get the latest version for "Linux x86_64") using `wget` or `curl`. 
2. Run the installer `.sh` script to complete the install. When prompted with `Do you wish the installer to initialize Mambaforge by running conda init? [yes|no]` answer `yes`. 
3. Close and re-open your ssh session (log in as `serveruser` again). If the install worked, you will now see `(base)` in front of the command line prompt. 
4. Use `mamba` to install `flask` (a python package for web development) (**see hint below**). 
5. **Q10. What is the output of `flask --version`?**
6. **Q11. What is the output of `mamba -V`?**

**Hint**: If you are ever unsure how to use `mamba`, remember that it is generally the same as `conda` except that you replace "conda" with "mamba." For example, if I wanted to install [fastapi](https://fastapi.tiangolo.com/) using `mamba`, I would google "conda install fastapi" to find the [fastapi install instructions for conda](https://anaconda.org/conda-forge/fastapi) and then just rewrite it like so:

```shell
# Instead of this:
# conda install -c conda-forge fastapi

# Use this:
mamba install -c conda-forge fastapi
```

### Mamba environments

`mamba` (like `conda`) can create independent, self-contained package environments. This allows users to have multiple versions of packages and programming languages installed simultaneously without conflicts. 

When you begin using `mamba` / `conda`, you will be in the `(base)` environment. It is not advisable to install packages into this environment as this can cause a variety of conflicts and will eventually slow down `mamba` / `conda` performance. 

1. Create a new `mamba` environment called "py27" with python 2.7 installed in it. **Note** read the [docs](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands) for further guidance -- but make sure to use `mamba` instead of `conda`.  
2. Activate your new environment with:

```shell
mamba activate py27
```

3. **Q12. What is the output of `which python`?**
4. Return to your `(base)` environment with:

```shell
mamba deactivate
```

5. **Q13. What is the output of `which python` now?**

### Installing `salmon`

Use what you've learned in the previous steps to set up your environment for RNA-Seq analysis with `salmon`.

1. Using `mamba`, install `salmon` version `1.4.0` into a new environment called `salmonEnv` **Hint**: you will need to provide the `bioconda` channel to `mamba` in order for it to find the package. **Hint 2**: check out the documentation [here](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-pkgs.html#installing-packages) to see how to specify a particular version of a package (just replace `conda` with `mamba` when you run it yourself).
2. Activate `salmonEnv`.
3. **Q14. What is the output of `salmon -h`?**

## Simple RNA-Seq analysis with `salmon`

### Part 1: Generating the transcriptome index

RNA-Sequencing is a technique used for measuring RNA under various conditions. The most common application for this technology is differential gene expression (DGE), which answers the question "how does gene expression change under different conditions?". To perform DGE analysis, we first need a read count matrix, which is generated by quantifying RNA-Seq reads against a transcriptome. `salmon` is a very low-overhead CLI program for generating a read count matrix (which is important because you're currently on a machine with only 1 core and 1 GB of RAM!)

Before you can generate a read count matrix, you will need (1) a transcriptome index and (2) some RNA-Seq data to quantify against that index. We will start with (1) by buidling a transcriptome index for the Thale Cress plant, *Arabidopsis thaliana*.

1. Download the full transcriptome for *Arabidopsis thaliana*. **Q15. What does the `-o athal.fa.gz` part of the command do?**  **Q16. What is a `.gz` file?**

```shell
curl ftp://ftp.ensemblgenomes.org/pub/plants/release-28/fasta/arabidopsis_thaliana/cdna/Arabidopsis_thaliana.TAIR10.28.cdna.all.fa.gz -o athal.fa.gz
```

2. Examine this file using `zcat` and `head`:

```shell
zcat athal.fa.gz | head -n 100
```

Then, answer:
- **Q17. What does the `zcat` command do?**
- **Q18. what does the `head` command do?**
- **Q19. what does the number `100` signify in the command?**
- **Q20. What is `|` doing?** -- **Hint** using `|` in Linux is called "piping"  
- **Q21. What is a `.fa` file? What is this file format used for?**

3. Index the *Arabidopsis thaliana* transcriptome using `salmon`. You can find the `salmon` docs with detailed instructions for building transcriptome indices ([here](https://web.archive.org/web/20210118043821/https://salmon.readthedocs.io/en/latest/salmon.html#preparing-transcriptome-indices-mapping-based-mode)). **Note**: The index should take ~ 4-5 minutes to build and you do NOT need `decoys.txt`, so leave that part out. Adding extra arguments may also cause your machine to run out of memory -- use only the arguments in the tutorial (minus the `decoys.txt` part). **Note**: You should not need more than 450MB to build this index (last tested on Ubuntu 22.04 LTS and 20.04 LTS in November 2022). If you find that you are running out of memory (or storage), please double check your index command to ensure it uses the correct file with the `-t` flag. If you still find issues during this step, contact Henry and he will assist you.

### Part 2: Quantify RNA-Seq data

Now that we have built the transcriptome index for *arabidopsis thaliana*, we can download some RNA-Seq data and quantify it!

Publicly-available RNA-Seq data is typically stored in the Sequence Read Archive (SRA), a public database hosted by the U.S. NIH/NCBI. While the Gene Expression Omnibus (GEO) is used to access processed datasets, the SRA is where raw sequencing reads can be found. NCBI provides a series of computational tools for downloading these data and converting them into the correct format for analysis. 

1. Install `sra-tools` v2.11.0 into a new environment (`sraEnv`) using `mamba`. 
2. Download the RNA-Seq sample "SRR074122" using `prefetch` (part of the SRA tools). The documentation for `prefetch` can be found [here](https://web.archive.org/web/20220620111907/https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=prefetch) or by running `prefetch -h`. **Q22. What format are the downloaded sequencing reads in?** (If this step produces an error, provide the error message in your answer to **Q22** and then you can also try downloading the file directly from [here](https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR074122/SRR074122) -- note that you can use this file with the succeeding steps.)
3. Disk (storage) space is a concern when working with large sequencing files. Check your remaining disk space with the `df -h` command. The remaining space will be listed under `/dev/root`. **Q23. What is the total size of the disk?**, **Q24. How much space is remaining on the disk?**
4. Convert the reads to `fastq` format using this command: `fastq-dump SRR074122`. This should produce an error. Considering the previous question, answer **Q25. What went wrong?** (if you didn't encounter any errors, let Henry know and continue onward.)
5. Delete the partially-generated `.fastq` file. Then, modify the previous `fastq-dump SRR074122` command so that the issue in **Q25** no longer occurs. The documentation for `fastq-dump` can be accessed [here](https://web.archive.org/web/20220606012457/https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=fastq-dump) or by running `fastq-dump -h`. **Q26: What was your solution?** **Hint**: consider **Q16**. 
6. Once you have successfully converted your reads, use `salmon` to quantify them (using "mapping-based mode" -- see documentation [here](https://web.archive.org/web/20210118043821/https://salmon.readthedocs.io/en/latest/salmon.html#quantifying-in-mapping-based-mode)). Set the output folder name as `transcripts_quant/`. Use the transcriptome index for *Arabidopsis thaliana* which you built in the [previous section](#part-1-generating-the-transcriptome-index). **Note** These reads are single-end, so make sure you are using the appropriate command for single-ended reads. **Note 2**: You should not need more than 610MB of RAM for this step (last tested on Ubuntu 22.04 LTS and 20.04 LTS in November 2022). If you find that you are using more than that, please re-check the index command you used in the previous section. If you still find issues during this step, contact Henry and he will assist you. **Note 3**: If you are unsure about what to put for the library type, check the docs [here](https://web.archive.org/web/20210118043821/https://salmon.readthedocs.io/en/latest/salmon.html#what-s-this-libtype).

## Wrap-up

To complete the project, commit and push your `answers.md` to your fork. Then, let Henry know (and send him the link to your fork and anything required to access your AWS server as `serveruser`). He will access the server, check your configuration and your `quant.sf` file -- and will certify completion of the skill assessment if everything is correct.

