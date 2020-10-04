
CC = g++
CFLAGS = -O3 -Wall -fopenmp

all: 	gsl_dgemm_BLAS gsl_dgemm_BLAS64 gsl_dgemm_GSLCBLAS gsl_dgemm_PSBLAS \
			gsl_dgemm_ATLAS gsl_dgemm_ATLASi2 \
			gsl_dgemm_OpenBLAS gsl_dgemm_OpenBLAS64 gsl_dgemm_BLIS gsl_dgemm_MKL\
			gsl_dgemm_ATLASt gsl_dgemm_ATLASi2t \
			gsl_dgemm_OpenBLASomp gsl_dgemm_OpenBLAS64omp\
			gsl_dgemm_OpenBLASpth gsl_dgemm_OpenBLAS64pth\
			gsl_dgemm_BLISomp gsl_dgemm_BLISpth gsl_dgemm_MKLt\
			gsl_dgemm_MKLMPI gsl_dgemm_BLISMPI

rasp: gsl_dgemm_BLAS gsl_dgemm_OpenBLAS gsl_dgemm_BLIS

#Implememntação direta
teste_GSL_DGEMM.o: teste_GSL_DGEMM.c
	$(CC) -c $(CFLAGS) teste_GSL_DGEMM.c

#Linkando
#Versões sequenciais
#Linkando com a BLAS 01
gsl_dgemm_BLAS: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_BLAS -lgsl -lcblas teste_GSL_DGEMM.o

#Linkando com a BLAS64 02
gsl_dgemm_BLAS64: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_BLAS64 -lgsl -lcblas64_ teste_GSL_DGEMM.o

#Linkando com a GSLCBLAS 03
gsl_dgemm_GSLCBLAS: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_GSLCBLAS -lgsl -lgslcblas teste_GSL_DGEMM.o

#Linkando com a PSBLAS 04
gsl_dgemm_PSBLAS: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_PSBLAS -lgsl -lpsb_base teste_GSL_DGEMM.o

#Linkando com a ATLAS 05
gsl_dgemm_ATLAS: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_ATLAS -lgsl -L /usr/lib64/atlas -lsatlas teste_GSL_DGEMM.o

#Linkando com a ATLASi2 06
gsl_dgemm_ATLASi2: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_ATLASi2 -lgsl -L /usr/lib64/atlas-corei2 -lsatlas teste_GSL_DGEMM.o

#Linkando com a OpenBLAS 07
gsl_dgemm_OpenBLAS: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_OpenBLAS -lgsl -lopenblas teste_GSL_DGEMM.o

#Linkando com a OpenBLAS64 08
gsl_dgemm_OpenBLAS64: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_OpenBLAS64 -lgsl -lopenblas64 teste_GSL_DGEMM.o

#Linkando com a BLIS 09
gsl_dgemm_BLIS: teste_GSL_DGEMM.o
	#$(CC) $(CFLAGS) -o gsl_dgemm_BLIS -lgsl -L /usr/lib64/sblis/lib -lblis teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_BLIS -lgsl -L /opt/BLIS/sblis/lib -lblis teste_GSL_DGEMM.o

#Linkando com a MKL 10
gsl_dgemm_MKL: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_MKL -lgsl -lmkl_intel_ilp64 -lmkl_core -lmkl_sequential teste_GSL_DGEMM.o

#Implementações paralelas

#Em memória compartilhada

#linkando com a ATLAS threads 11
gsl_dgemm_ATLASt: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_ATLASt -lgsl -L /usr/lib64/atlas -ltatlas teste_GSL_DGEMM.o

#linkando com a ATLASi2 threads 12
gsl_dgemm_ATLASi2t: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_ATLASi2t -lgsl -L /usr/lib64/atlas-corei2 -ltatlas teste_GSL_DGEMM.o

#Linkando com a OpenBLAS omp 13
gsl_dgemm_OpenBLASomp: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_OpenBLASomp -lgsl -lopenblaso teste_GSL_DGEMM.o

#Linkando com a OpenBLAS64 omp 14
gsl_dgemm_OpenBLAS64omp: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_OpenBLAS64omp -lgsl -lopenblaso64 teste_GSL_DGEMM.o

#Linkando com a OpenBLAS pth 15
gsl_dgemm_OpenBLASpth: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_OpenBLASpth -lgsl -lopenblasp teste_GSL_DGEMM.o

#Linkando com a OpenBLAS64 pth 16
gsl_dgemm_OpenBLAS64pth: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_OpenBLAS64pth -lgsl -lopenblasp64 teste_GSL_DGEMM.o

#Linkando com a BLIS omp 17
gsl_dgemm_BLISomp: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_BLISomp -lgsl -L /opt/BLIS/oblis/lib -lblis teste_GSL_DGEMM.o

#Linkando com a BLIS pth 18
gsl_dgemm_BLISpth: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_BLISpth -lgsl -L /opt/BLIS/pblis/lib -lblis teste_GSL_DGEMM.o

#Linkando com a MKL threads 19
gsl_dgemm_MKLt: teste_GSL_DGEMM.o
	$(CC) $(CFLAGS) -o gsl_dgemm_MKLt -lgsl -lmkl_intel_ilp64 -lmkl_core -lmkl_gnu_thread teste_GSL_DGEMM.o

gsl_dgemm_MKLMPI: teste_GSL_DGEMM_MPI.o
		mpicc $(CFLAGS) -o gsl_dgemm_MKLMPI -lgsl -lmkl_intel_ilp64 -lmkl_core -lmkl_sequential teste_GSL_DGEMM_MPI.o

gsl_dgemm_BLISMPI: teste_GSL_DGEMM_MPI.o
			mpicc $(CFLAGS) -o gsl_dgemm_BLISMPI -lgsl -L /usr/lib64/sblis/lib -lblis teste_GSL_DGEMM_MPI.o
			#$(CC) $(CFLAGS) -o gsl_dgemm_BLIS -lgsl -L /usr/lib/sblis/lib -lblis teste_GSL_DGEMM.o


clean:
	rm -f gsl_dgemm*
	rm -f *.o
	rm -f *.dat
	rm -f *.png
	rm -f *.log

#gsl_dgemm_tiled: teste_GSL_DGEMM_P.o
#	$(CC) $(CFLAGS) -o gsl_dgemm_tiled -lgsl -lcblas teste_GSL_DGEMM_P.o

#gsl_dgemm_tiled_A:teste_GSL_DGEMM_P.o
#	$(CC) $(CFLAGS) -o gsl_dgemm_tiled_A -lgsl -L /usr/lib64/atlas -lsatlas teste_GSL_DGEMM_P.o


#$(CC) $(CFLAGS) -o dgemm_GSL -fopenmp -lgsl -lgslcblas example_001.c
#$(CC) $(CFLAGS) -o dgemm_GSL -fopenmp -lgsl -L /usr/lib64/atlas -lsatlas example_001.c
