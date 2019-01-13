export lanes=$(ls | grep '_L[0-9]*' -o | uniq)
lanes=${lanes//_}
echo "$lanes" > lanes.txt

for lane in $lanes
do
	export R1_files=$(ls | grep $lane"_R1_")
	array=($R1_files)
	if [ ${#array[@]} != 1 ]
		then
		echo "Merging fastq files for: "$name" lane: "$lane" R1  " $(date)
		ls | grep $lane"_R1_"|xargs cat >> $lane'_R1.fastq.gz'
	else
		mv $R1_files $lane'_R1.fastq.gz'
	fi

	export R2_files=$(ls | grep $lane"_R2_")
	array=($R2_files)
	if [ ${#array[@]} != 1 ]
		then
		echo "Merging fastq files for: "$name" lane: "$lane" R2  " $(date)
		ls | grep $lane"_R2_"|xargs cat >> $lane'_R2.fastq.gz'
	else
		mv $R2_files $lane'_R2.fastq.gz'
	fi
done
