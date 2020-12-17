#!/usr/bin/perl -w

$in = $ARGV[0] || die " mmammamamamamam";
chomp $in;
@infonodes = `cat infomaps/A_B_w-$in.clu`;
@nodenames = `cat nodes/nodes_id-$in.csv`;
@filenames = `cat metrics/\"$in\"_OO-metrics.csv`;

foreach $line(@infonodes){
        if ($line !~ m/^\#/){
            chomp $line;
            @data = split(/ /, $line);
            $node_ID = $data[0];
            $group_ID = $data[1];
        
            @found_nodename = grep /\,$node_ID$/, @nodenames;
            $nodename = $found_nodename[0];
            chomp $nodename;
            $nodename =~ s/\,.*//;
            
            @found_filename = grep /\"$nodename\"/, @filenames;
            $temp = $found_filename[0];
            @data = split(/,/, $temp);
            $filename = $data[2];
            $filename =~ s/RELATIVE://;
            
            print "$in,$group_ID,$node_ID,$nodename,$filename\n";
        }
}
