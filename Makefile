CC = gcc
CFLAGS = -Werror -Wextra -Wall
LDFLAGS = -L/usr/local/lib -lcryptopp -lpthread

SRCDIR = src
OBJDIR = obj

EXECUTABLE = CryptoCurrency

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRC))

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJDIR) $(EXECUTABLE)

re: clean all
