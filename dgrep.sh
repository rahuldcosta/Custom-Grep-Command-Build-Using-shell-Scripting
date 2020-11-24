#================================================================================#
# Author:- Rahul Dcosta(1337) & Kaushal Kishore (1357)                		 #
# Description:-Shell Script to Compare two files and report if they are different#
# Date Created:-20/02/2014                                            		 #
# Date Modified:-21/02/2014                            		      		 #
#================================================================================#

#========Start of Shell Script=========#
if [ $# -gt 0 ]
then
curdir=$(pwd)
old=`echo $#`

#Type 1 :-  scrpit.h -pattern
if [ $# -eq 1 -a `echo $1 | grep -E ^-[hxcofrq]*$ |wc -l` -eq 0 ]
then
  [[ `echo $1 | grep -E ^-|wc -l` -eq 1 ]] && printf "cannot have pattern having - sign in the begining \ndo a $0 -h for help\n" && exit
pattern=$1
grep "$pattern" ./* --color
fi


#Type 2 :- script.h -pattern  series_of_dir's
if [ $# -gt 0 ]
then
#part 1
if [ `echo $1 | grep -E ^-[hxcofrq]*$ |wc -l` -eq 0 ]
then
pattern=$1
shift
####################
	for  i in $*
do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "New For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep "`echo $pattern`" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
done
fi
#Type 2 :- script.h -option -pattern  series_of_dir's
if [ `echo $1 | grep -E ^-[hxcofrq]*$ |wc -l` -eq 1 ]
then
 [[ "$1" = "-" ]]&& echo "Invalid Option==> $1" && exit 
option=$1
pattern=$2
shift
shift
##################################
va="$option"
len=$(echo ${#va} )
counth=0
countr=0
countx=0
countc=0
counto=0
countf=0
countq=0
for (( zb=1;zb<len;zb++ ))
do
   var=$(echo ${va:$zb:1})
	
[[ "$var" = "h" ]] && let counth++
[[ "$var" = "r" ]] && let countr++	
[[ "$var" = "x" ]] && let countx++
[[ "$var" = "c" ]] && let countc++
[[ "$var" = "o" ]] && let counto++
[[ "$var" = "f" ]] && let countf++
[[ "$var" = "q" ]] && let countq++

done

[[ $counth -gt 1 ||$countr -gt 1 ||$countf -gt 1 ||$countc -gt 1 || $countx -gt 1 || $counto -gt 1 || $countq -gt 1 ]] && echo "$0:$option invalid option usage" && exit

 for (( zb=1;zb<len;zb++ ))
do
   var=$(echo ${va:$zb:1})


case $var in

	h) 
	if [ $old -eq 1 -a $len -eq 2 ]
	then	
	cat help.txt 
	else
	echo "$0:$option invalid option usage"
	exit
	fi
	
	;;
	q) if [ $old -gt 3 -a $len -eq 2 ]
	  then
		num=$pattern
	   pattern=$1
	  shift
	echo $num $pattern
	  for  i in $*
do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	for x in `ls -1`
	do 
	 cat $x|head -$num |grep "$pattern" --color
	done
	
	else
	echo "$i is not a Directory"
	fi
	done
	 else
	 echo "invalid usage of option" 

	fi
	
	
	;;	
	c) 
	if [ $old -gt 2 -a $len -gt 1 ]
	  then
	if [ $len -eq 2 ]
	then
	for  i in $*
do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep -c "$pattern" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
	done
	
  	  fi
	if [ $len -eq 3 -a "$va" = "-cr" ]
	   then
#################################		
	for  i in $*
	do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep -cr "$pattern" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
	done
	
#################################
	fi
	
	exit
	else
	echo "$0:$option invalid option usage"
  	  exit	
	fi
	;;
	o) 
	if [ $old -gt 2 -a $len -gt 1 ]
	  then
	if [ $len -eq 2 ]
	then
	for  i in $*
do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep -oH "$pattern" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
	done
	
  	  fi
	if [ $len -eq 3 -a "$va" = "-or" ]
	   then
#################################		
	for  i in $*
	do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep -or "$pattern" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
	done
	
#################################
	fi
	
	exit
	else
	echo "$0:$option invalid option usage"
  	  exit	
	fi
	
	;;
	r) 
	if [ $old -gt 2 -a $len -gt 1 ]
	  then
	if [ $len -eq 2 ]
	then
	for  i in $*
do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep -r "$pattern" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
	done
	else
	echo "$0:$option invalid option usage"
  	  exit	
	fi
	
	if [ $len -eq 3 ]
	   then
#################################		
	for  i in $*
	do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	[[ "$va" = "-rc" ]] && grep -rc "$pattern" "$path/"* --color && exit ||[[ "$va" = "-ro" ]] && grep -ro "$pattern" "$path/"* --color && exit
	else
	echo "$i is not a Directory"
	fi
done
	
#################################
	else
	echo "$0:$option invalid option usage"
	   fi
	else
	echo "$0:$option invalid option usage"
	exit
	fi
		
	;;
	x) 
	if [ $old -gt 2 -a $len -eq 2 ]
	  then
	for  i in $*
do	
	path=`find ~ -type d -a -name $i`
	if [ -d "$path" ]
	then
	echo "For Directory ==>> $i"
	
	#echo $path	
	cd "$path"
	grep -n "$pattern" "$path/"* --color
	else
	echo "$i is not a Directory"
	fi
	done
	exit
	else
	echo "$0:$option invalid option usage"	
	exit
	fi
	;;
	f) 
	  if [ $old -eq 2 -a $len -eq 2 ]
	  then
	 [[ -f "$pattern" ]] && find ~ -type f -a -name "$pattern" && exit || echo "$pattern is not a File" 
	else
	echo "$0:$option invalid option usage"
	exit
	fi
	 
	;;
esac
done
fi
########END###########
fi
else
	find . -maxdepth 1 -type f | cut -d'/' -f2
fi
cd $curdir
     
