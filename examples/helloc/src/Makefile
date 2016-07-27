
ifneq ($(shell readlink -e ../.conf),)
include ../.conf
endif

TARGET=helloc
OBJS=main.o

ifneq ($(FEATURE1),)
OBJS += feature1.o
endif

ifneq ($(FEATURE2),)
OBJS += feature2.o
endif

ifneq ($(FEATURE3),)
OBJS += feature3/feature3.o
endif

ifneq ($(FEATURE4),)
OBJS += feature4/feature4.o
endif

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

clean:
	rm -f *.o $(TARGET)

run:
	./$(TARGET)
