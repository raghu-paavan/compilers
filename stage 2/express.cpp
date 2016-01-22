tnode* makeleaf(int n)
{
	
	tnode* temp= new tnode();
	temp->op=0;
	temp->val=n;
	temp->left =NULL;
	temp->right =NULL;
	return temp;
}

tnode* makeop(char c, tnode*l, tnode*r)
{
	tnode *temp= new tnode();
	temp->op= c;
	temp->left=l;
	temp->right=r;
	return temp;
}

int evaluate(tnode* t)
{
	if(t==NULL)
		return 10;
	if(t->op==0) return t->val;
	else 
	{
		switch(t->op)
		{
			case '+' : return evaluate(t->left)+evaluate(t->right);break;
			case '-' : return evaluate(t->left)-evaluate(t->right);break;
			case '*' : return evaluate(t->left)*evaluate(t->right);break;
			case '/' : return evaluate(t->left)/evaluate(t->right);break;
		}
	}
}