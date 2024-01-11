#include <stdio.h>
#include <string.h>
#include "mpi.h"
#include <unistd.h>

int main(int argc, char* argv[]){
	int  my_rank; /* rank of process */
	int  p;       /* number of processes */
	int source;   /* rank of sender */
	int dest;     /* rank of receiver */
	int tag=0;    /* tag for messages */
	char message[100];        /* storage for message */
	MPI_Status status ;   /* return status for receive */
	
	/* start up MPI */
	
	MPI_Init(&argc, &argv);
	
	/* find out process rank */
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank); 
	
	/* find out number of processes */
	MPI_Comm_size(MPI_COMM_WORLD, &p); 
	
  int host_len = 32;
  char host_name[33] = {0};
  gethostname(host_name, host_len);
	
	if (my_rank !=0){
		/* create message */
		sprintf(message, "Hello MPI World from process %d on host %s!", my_rank, host_name);
		dest = 0;
		/* use strlen+1 so that '\0' get transmitted */
		MPI_Send(message, strlen(message)+1, MPI_CHAR,
		   dest, tag, MPI_COMM_WORLD);
	}
	else{
		printf("Hello MPI World From process 0 on host %s: Num processes: %d\n", host_name, p);
		for (source = 1; source < p; source++) {
			MPI_Recv(message, 100, MPI_CHAR, source, tag,
			      MPI_COMM_WORLD, &status);
			printf("%s\n",message);
		}
	}
	/* shut down MPI */
	MPI_Finalize(); 
	
	
	return 0;
}

