CC = g++
CFLAGS = -g -Wall
LDFLAGS = -L/usr/local/lib -lcryptopp -lpthread

SRCDIR = src
OBJDIR = obj

EXECUTABLE = Currency

SRC = $(wildcard $(SRCDIR)/*.cpp)
OBJ = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRC))

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o $(EXECUTABLE)
