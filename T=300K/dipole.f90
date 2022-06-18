!**********************************************************************
!**********************************************************************
! Roger Bellido Peralta
! 31/05/2022
!**********************************************************************
!**********************************************************************

      program dipole
       implicit none
       integer :: i,j,n,t,t_f,counter
       real*8,dimension(:,:),allocatable :: x,y,z
       real*8,dimension(:),allocatable :: c_rot
       character*3,dimension(:,:),allocatable :: a
       real*4 :: time1,time2
       character*30 :: date1,date2,trash
     
       call fdate(date1)
       call cpu_time(time1)
       write(*,*)"beginning:",date1
     
       open(10,file="trajectory_69.xyz",status="old")
       t_f=100
       do i=1,t_f
        read(10,*)n
        read(10,*)t
        
        if (i.eq.1) then
         allocate(a(t_f,n),x(t_f,n),y(t_f,n),z(t_f,n))
        end if
        do j=1,n
         read(10,*)a(i,j),x(i,j),y(i,j),z(i,j)
        end do
       end do
       close(10)
       
       allocate(c_rot(t_f))
       
       call dipole_calc(t_f,n,a,x,y,z,c_rot)
      
       open(11,file="c_rot_69.dat",status="new")
       write(11,*)'# frame, t(ps), c_rot'
       do i=1,t_f
        write(11,*)i,dble(i)/10d0,c_rot(i)
       end do

       call cpu_time(time2)
       call fdate(date2)
       write(*,*)"ending...:",date2
       write(*,*)"cputime=",time2-time1,'s ', (time2-time1)/60d0,'m'
     
      end program dipole
     
    
!**********************************************************************
!**********************************************************************
!     functions and subroutines
!**********************************************************************
!**********************************************************************

      subroutine dipole_calc(t_f,n,a,x,y,z,c_rot)
       implicit none
       integer :: i,j,n,t,t_f,counter,ind,norm
       real*8 :: b1_x,b1_y,b1_z,m_b1,b2_x,b2_y,b2_z,m_b2,m_b1b2,den
       real*8,dimension(t_f,n) :: x,y,z
       character*3,dimension(t_f,n) :: a
       real*8,dimension(:,:),allocatable :: mu_x,mu_y,mu_z
       real*8,dimension(t_f) :: c_rot
       
       ! Computing of the dipole vectors
       counter=0
       do i=1,1
        do j=1,n-2
         if ((a(i,j).eq.'OH2').and.(a(i,j+1).eq.'H1').and.&
         (a(i,j+2).eq.'H2')) then
         counter=counter+1
         end if
        end do
       end do     

       allocate(mu_x(t_f,counter),mu_y(t_f,counter),mu_z(t_f,counter))
       

       do i=1,t_f
        ind=0       
        do j=1,n-2
         if ((a(i,j).eq.'OH2').and.(a(i,j+1).eq.'H1').and.&
         (a(i,j+2).eq.'H2')) then
         ind=ind+1
         
         b1_x=x(i,j)-x(i,j+1)
         b1_y=y(i,j)-y(i,j+1)
         b1_z=z(i,j)-z(i,j+1)
         
         m_b1=dsqrt(b1_x**2d0+b1_y**2d0+b1_z**2d0)

         b2_x=x(i,j)-x(i,j+2)
         b2_y=y(i,j)-y(i,j+2)
         b2_z=z(i,j)-z(i,j+2)

         m_b2=dsqrt(b2_x**2d0+b2_y**2d0+b2_z**2d0)
         
         m_b1b2=dsqrt((m_b2*b1_x+m_b1*b2_x)**2d0+&
                      (m_b2*b1_y+m_b1*b2_y)**2d0+&
                      (m_b2*b1_z+m_b1*b2_z)**2d0)     
                  
         mu_x(i,ind)=(m_b2*b1_x+m_b1*b2_x)/m_b1b2
         mu_y(i,ind)=(m_b2*b1_y+m_b1*b2_y)/m_b1b2
         mu_z(i,ind)=(m_b2*b1_z+m_b1*b2_z)/m_b1b2
         end if
        end do
       end do     

       ! Denominator computing
       print*,'counter=',counter
       den=0d0
       norm=0
       do j=1,counter
        norm=norm+1
        den=den+(mu_x(1,j)**2d0+mu_y(1,j)**2d0+mu_z(1,j)**2d0)
       end do
       den=den/dble(norm)
       print*,den
       ! Final computing
       c_rot=0d0
       do i=1,t_f
        do j=1,counter
         c_rot(i)=c_rot(i)+(mu_x(i,j)*mu_x(1,j)+mu_y(i,j)*mu_y(1,j)+&
                  mu_z(i,j)*mu_z(1,j))
        end do
       end do

       c_rot=c_rot/dble(norm)/den

      return
      end subroutine dipole_calc
      
      
