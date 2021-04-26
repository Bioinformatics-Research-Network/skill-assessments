# Linux CLI (Bash / Shell) for Bioinformatics

**Note**: This training will require setting up a free AWS account, which requires a credit card that can do business in the U.S. If you do not have a card like this and cannot get one, let Henry know and he will help you.

This training is designed to test your basic fluency in the Linux environment and your ability to utilize google to complete challenges on the command line. It also has the added bonus of giving you a glimpse into the wide world of AWS. Please follow all instructions. Wherever you are asked to answer a question, answer it in a separate markdown file called `answers.md`, which should be commited using `git` and pushed to your fork of the training repo on GitHub. Once you are done, let Henry know (and send anything needed to access your server). 

For example, if I asked:
>Q1. In the command `ls`, what do `l` and `s` stand for?

This would be what I expect to see in `answers.md`:

>Q1: In the command `ls`, what do `l` and `s` stand for?  
A: `ls` stands for "**l**ist **s**torage"

See an example in `answer_example.md`

## Preliminary - complete a Linux course
Before you begin this, you should already have completed a basic Linux course / tutorial such as:

- Introduction to Shell ([DataCamp](https://learn.datacamp.com/courses/introduction-to-shell))
- YouTube Shell Tutorial ([here](https://www.youtube.com/watch?v=oxuRxtrO2Ag))

Also, don't forget about the Linux CLI cheatsheets (e.g., [this](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)).

## Create a free Linux server in AWS

AWS is a cloud provider which allows users to create small linux servers for free. Create an AWS account and follow their [tutorial](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-launch-instance) to set up a linux server (you don't need to change the default security group settings). Choose the `Ubuntu Server 20.04 LTS` since that tends to be a fairly easy distribution of Linux for beginners. 

**NOTE** DO NOT PAY FOR ANYTHING. Make sure that you only select "free tier eligible" options so that you don't get charged anything. You can also [sign up](https://aws.amazon.com/education/awseducate/) for an AWS Educate account (if you are a student) to get $30 in free credits without providing credit card info. Also, be careful with anything that's not in the free tier (there's no need to use paid services in this tutorial) -- you can find yourself spending a lot of money very quickly if you create an expensive server and leave it running for a long time.

## Connect to your linux instance using ssh and SFTP

Secure Shell (ssh) is a protocol for encrypted communication between computers over the internet. It uses a client-server model in which remote machines are "servers" and your local machine is the "client". For example, you can use your laptop (ssh client) to connect to a linux machine on AWS (ssh server). Once the connection is established, it is easy to operate the remote machine using the linux command line interface (CLI).

Secure File Transfer Protocol (SFTP) is a protocol for encrypted file transfers between computers over the internet. It uses a similar model to ssh except that, instead of issuing CLI commands, it allows clients to upload and download files between their computer and the server. 

**NOTE**: For any of the methods below, you can connect to the `Public IPv4 address` or the `Public IPv4 DNS` listed in the EC2 instance page for your server. The username will be `ubuntu` and you need the private key (`.pem`) file that was provided by AWS in order to connect.

### For Windows users only

#### MobaXTerm (ssh and SFTP)

You're in luck! Windows is actually the best OS for connecting to remote linux servers because of [MobaXTerm](https://mobaxterm.mobatek.net/). MobaXTerm is, by far, the easiest way to connect to and utilize linux machines. It has tabbed ssh sessions, a built-in SFTP panel, remote text editing, and so much more -- and it's free! [Here](https://www.devopshint.com/how-to-connect-to-aws-ec2-instance-using-mobaxterm/) is a very brief tutorial on how to connect to AWS EC2 using MobaXTerm. 

#### PuTTY (ssh)

PuTTY is a popular ssh client on Windows and you can find a tutorial for connecting to an AWS EC2 instance from PuTTY [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html). 

#### WSL (ssh)

The Windows Subsystem for Linux (WSL) is a very useful tool for any Windows-based developer to know about. It also has a built-in ssh client which you can use for connecting to your linux server. Learn how to set up WSL [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Learn how to connect to your linux EC2 instance [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/WSL.html).

### For MacOS Only

#### Terminal

The method preferred by many MacOS developers is simply to use the built-in `terminal`. [Here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html) is the relevant section of the AWS tutorial -- the MacOS terminal should have an ssh client built in which you can use. 

### For Windows and MacOS

#### FileZilla (SFTP)

[FileZilla](https://filezilla-project.org/) is an excellent, free FTP client which you can use for SFTP connections to remote machines. [Here](https://docs.aws.amazon.com/transfer/latest/userguide/transfer-file.html) is a tutorial which includes a section about using FileZilla for connecting to AWS EC2 instances. 

**NOTE**: MobaXTerm users will not need FileZilla.

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

Using `nano` (recommended), `emacs`, or `vim`, complete the following:

1. Open `hello_world.txt`
2. Change `world` to `Linux`.
3. Save your changes to the file.
4. Run `cat` on your modified file. The output should be `Hello Linux!`.

## Set up a protected sudoer account and connect with it

While using the default `ubuntu` account is convenient, it also creates severe security issues. Anyone who holds your key (`.pem` file) has total control over your server. That's why it is good practice to make a secure admin account which has password-protected `sudo` capabilities. *Bonus points if you can figure out how to do 2FA instead.*

Complete the following:

1. Using `sudo adduser`, create a new user called `sudouser`. 
2. Set a strong, unique password for `sudouser` (I personally use [last pass](https://www.lastpass.com/password-generator)) and complete the rest of the setup using the defaults. After this step, you should see the directory `/home/sudouser/` has been created.
3. Use the `sudo usermod` command to give `sudouser` the ability to use the `sudo` command. 
4. Switch to the `sudouser` account with `su - sudouser`. You should now see `sudouser@ip-xxx-xx-xx-xxx:~$` at beginning of each line. This indicates you are now logged in as `sudouser`. 
5. Run `sudo ls /root` to confirm that `sudo` is working -- you should see it output the word `snap`.
6. Finally, close your `ssh` client. Re-open it and then connect again with the username `sudouser` but with ALL other connection settings the same as before. This should lead to an error. **Q5. Why didn't that work?** Solve the issue.  **Q6. What was the solution?** To complete this training, you have to log in as `sudouser` and correctly explain what went wrong (see hints 1 and 2 below). There is no reason to switch to a different `ssh` client. MobaXTerm, WSL, PuTTY, and Terminal all work fine for this. (Also, if you didn't get an error when logging in as `sudouser`, let Henry know...)
7. Once you finally log in with `sudouser`, confirm again that you have `sudo` access by running `sudo ls /root`.
8. If you are certain that your `sudouser` login is working correctly, delete the `ubuntu` account with the `deluser` command. You should now be unable to log in as `ubuntu`.

**Hint 1**: Use your google skills, don't be afraid of watching/reading an ssh tutorial ([for example](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)), and remember that, whenever you learn new computing skills, most of the errors are either because you don't yet understand how the tools work or because you typed something incorrectly. 

**Hint 2**: There are two problems, both related to how you log in. The first problem is solved by changing the connections settings in your `ssh` client (if using MobaXTerm / PuTTY) or changing your connection command (if you are using WSL/Terminal). The second problem is more difficult and there are two main solutions to it. One of them involves changing how users log in (this is a bad solution for security reasons). The other will require generating a key that `sudouser` can use to log in. 

## Docker

Log in as `sudouser`. Now that you are on a password-protected `sudo` account, it's time to start setting up your system. One of your first tasks will be to update the system and then install Docker. Docker is an excellent tool for managing software using 'containers'. Learn more about getting started with Docker [here](https://docs.docker.com/get-started/). For now, complete the following:

1. Update the system by running the following:
```
sudo apt-get update
sudo apt-get upgrade
```
2. Complete the steps in the Docker [guide](https://docs.docker.com/engine/install/ubuntu/) to install docker.
3. Run the following to confirm it is working:
```
sudo docker run hello-world
```
4. Pull the docker image for the `salmon` pseudomapper ([about](https://salmon.readthedocs.io/en/latest/salmon.html)).
```
sudo docker pull combinelab/salmon
```
5. Confirm that `salmon` is working by running the following:
```
sudo docker run combinelab/salmon salmon swim
```
6. Regarding the previous command, **Q7. what does the `sudo docker run` part of the command do? and what does the `salmon swim` part of the command do?** Read the docs for docker and run `salmon -h` for more info. The output for `salmon swim` should look like this:
```
Version Info: This is the most recent version of salmon.

    _____       __
   / ___/____ _/ /___ ___  ____  ____
   \__ \/ __ `/ / __ `__ \/ __ \/ __ \
  ___/ / /_/ / / / / / / / /_/ / / / /
 /____/\__,_/_/_/ /_/ /_/\____/_/ /_/

```

7. Now that you're done, free up space by removing unused docker images.
```
sudo docker system prune -a
```

## Set up a non-sudo user account

While `sudo` access is convenient for when you need to install / update software system-wide, you can't always count on having it. In fact, it's safer to limit the number of users with `sudo` access, so most systems will only have a few of them. The rest of the users will be non-`sudo`. Complete the following to set up a non-`sudo` account:

1. Create a new user account, `serveruser`, that has a strong and randomly-generated password, a home directory, and the ability to access the server.
2. Successfully connect to the server using `serveruser`.
3. Try running `sudo ls /root`, **Q8. What is the output of this command?**

## Miniconda

Anaconda / Miniconda is the most popular package management tool for data science and bioinformatics. It also allows users to install software without `sudo` access, making it useful for a variety of linux environments. 

As `serveruser`, complete the following:
1. Download the [miniconda3 installer](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh) using `wget` or `curl`. 
2. Run the installer `.sh` script to complete the install. When prompted with `Do you wish the installer to initialize Miniconda3 by running conda init? [yes|no]` answer `yes`. 
3. Close and re-open your ssh session (log in as `serveruser` again). If the install worked, you will now see `(base)` in front of the command line prompt. 
4. Use `conda` to install `salmon`. **Note**: If you are ever unsure of the correct `conda` command to install a package, simply google "Conda install (package_name)" and click the first result. For example, if I didn't know how to install salmon, I would have googled "conda install salmon" and then found this [page](https://anaconda.org/bioconda/salmon) which shows the install command I need.\*
```
conda install -c bioconda -c conda-forge salmon
```

**Note:** This code has been updated to include `-c conda-forge` because new `conda` installations on new EC2 instances may lack some core libraries that cannot be obtained through `bioconda` alone.

\*This may produce an error for some users. If it does, try using your google skills and see if you can solve it. A good idea is to google the name of the tool + the content of the error message. You can also visit the GitHub page for the tool and search in the "Issues" section. If you can't find the solution after 30 minutes, ask Henry and he will help you. 
5. Read the `conda install` reference ([here](https://docs.conda.io/projects/conda/en/latest/commands/install.html)). In the previous command, **Q9. what does `-c bioconda` do?**
6. Confirm this worked by running `salmon swim`. 

## Simple RNA-Seq analysis `salmon`

### Part 1: Generating the transcriptome index

RNA-Sequencing is a technique used for measuring RNA species under various conditions. The most common application for this technology is differential gene expression (DGE), which answers the question "how does gene expression change under different conditions?". To perform DGE analysis, we first need a read count matrix, which is generated by quantifying RNA-Seq reads against a transcriptome. `salmon` is a popular CLI program for generating a read count matrix -- it does this quickly and with very little computational overhead. This is important because you're currently on a machine with only 1 core and 1 GB of RAM!

To generate a gene count matrix, do the following:

1. Download the transcriptome for *arabidopsis thaliana*, the "thale cress". **Q10. What does the `-o athal.ga.gz` part of the command do?**  **Q11. What is a `.gz` file?**
```
curl ftp://ftp.ensemblgenomes.org/pub/plants/release-28/fasta/arabidopsis_thaliana/cdna/Arabidopsis_thaliana.TAIR10.28.cdna.all.fa.gz -o athal.fa.gz
```
2. Examine this file using `zcat` and `head`. Also, answer the following: **Q12. What does the `zcat` command do?**, **Q13. what does the `head` command do?**, **Q14. what does the number `100` signify in the command?**, **Q15. What is `|` doing?** -- **Hint** using `|` in Linux is called "piping"  
```
zcat athal.fa.gz | head -n 100
```
3. Build the `salmon` index. You can find the docs with detailed instructions ([here](https://salmon.readthedocs.io/en/latest/index.html)). **Note**: The index should take ~ 4-5 minutes to build and you do NOT need `decoys.txt`, so leave that part out. 

### Part 2: Quantify RNA-Seq data

RNA-Seq data is commonly stored in the Sequencing Read Archive (SRA), a public database hosted by the NCBI. While Gene Expression Omnibus (GEO) is used to access processed datasets, SRA is where the raw sequencing reads can be found. NCBI provides a series of computational tools that can be used to download these data and convert them into the correct format for analysis. 

1. Install `sra-tools` using `conda`. 
2. Download the RNA-Seq sample "SRR074122" using `prefetch` (part of the SRA tools). The documentation is [here](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=prefetch). **Q16. What format are the downloaded sequencing reads in?** (If this step produces an error, provide the error message in Q16 and then you can also try downloading the file directly from [here](https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR074122/SRR074122) -- note that you can use this file with the succeeding steps.)
3. Disk (storage) space is a concern when working with large sequencing files. Check your remaining disk space with the `df -h` command. The remaining space will be listed under `/dev/root`. **Q17. What is the total size of the disk?**, **Q18. How much space is remaining on the disk?**
4. Convert the reads to `fastq` format using `fastq-dump SRR074122`. This should produce an error. Considering the previous question and answer: **Q19. What went wrong?** (if you didn't encounter any errors, let Henry know...)
5. Delete the partially-generated `.fastq` file. Then, modify the previous `fastq-dump SRR074122` command so that the issue in **Q19** no longer occurs. The documentation for `fastq-dump` is [here](https://ncbi.github.io/sra-tools/fastq-dump.html). **Q20: What was your solution?** **Hint**: consider **Q11**. 
6. Once you have successfully converted your reads, use `salmon` to quantify them. Set the output folder name as `transcripts_quant/`. **Note** These reads are single-end.

## Wrap-up

To complete the project, commit and push your `answers.md` and let Henry know (and send him anything required to access your AWS server as `serveruser`). He will access the server, check your configuration and your `quant.sf` file -- and will certify completion of the miniproject if everything is correct.




