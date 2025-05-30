#/usr/bin/awk -f
#Jo Moeller, Mon May 11 12:51:07 CEST 2015
#wolfram, So 16. Mai 22:08:58 CEST 2010
#Arun, Wed Nov 14 23:30:44 CET 2018
# script to cut .fcc file of a medium sample
BEGIN {
    Lx=ARGV[1];
    ARGV[1]="";
    Ly=ARGV[2];
    ARGV[2]="";
    Lz=ARGV[3];
    ARGV[3]="";
    #distance of cutting planes to origin
    dist=ARGV[4];
    ARGV[4]="";
    #info from LEGO
    #Rotation matrix :
    # 0.000000000000 -0.577350269190 0.816496580928
    #0.707106781187 0.577350269190 0.408248290464
    #-0.707106781187 0.577350269190 0.408248290464
    #the rotations
    # the normals of the side are obtained: n[new_plane]=R'*n[old_plane] need do be normalized  
    n1[0]=0;#-111 plane
    n1[1]=0;
    n1[2]=0;
    n2[0]=0; #111 plane
    n2[1]=0.33333333333355; 
    n2[2]=0.94280904158238;
    n3[0]=0; #100 plane
    n3[1]=-0.57735026919000
    n3[2]=0.81649658092800;
    


}

{
if($0 !~ /#/ )
{
   
  #calculate the difference vector: vector(atom)-vector(center) 
    x=$4-Lx/2.0;
    y=$5-Ly/2.0;
    z=$6-Lz/2.0;
   #calculate the projection on the different plane normals ===> getting the length
   #ns1 is the the negative of the normal therefore the 'other side of the 3 defined planes 
    s1=x*n1[0]+y*n1[1]+z*n1[2]-dist;
    ns1=-x*n1[0]-y*n1[1]-z*n1[2]-dist;
    s2=x*n2[0]+y*n2[1]+z*n2[2]-dist;
    ns2=-x*n2[0]-y*n2[1]-z*n2[2]-dist;
    s3=x*n3[0]+y*n3[1]+z*n3[2]-dist;
    ns3=-x*n3[0]-y*n3[1]-z*n3[2]-dist;
    if(s1<0 && ns1<0 && s2<0 && ns2 <0 && s3<0 && ns3<0)
        print $0;

}
else
{print $0;}
}
