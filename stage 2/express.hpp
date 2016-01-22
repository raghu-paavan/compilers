typedef struct treenode
{
	int val;
	char op;
	treenode *left,*right;
}tnode;

tnode* makeleaf(int n);
tnode* makeop(char c,tnode*l, tnode*r);

int evaluate(tnode* t);

#define YYSTYPE tnode*