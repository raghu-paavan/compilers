typedef struct treenode
{
	bool read;
	bool write;
	bool assign;
	int val;
	char op;
	int condition;// if is 1 , while is 2; default is 0;
	treenode *left,*right;
}tnode;

tnode* makeleaf(int n);
tnode* makeid(char c);
tnode* makeop(char c,tnode*l, tnode*r);
tnode* readnode(char c);
tnode* writenode(tnode* t);
tnode* make_internal_node(tnode*l, tnode*r);
tnode* makecond(int condition_type,tnode*condition, tnode* statement);
int evaluate(tnode* t);
void final(tnode*t);


#define YYSTYPE tnode*