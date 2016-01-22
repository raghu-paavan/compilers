tnode* make_internal_node(tnode* l, tnode* r)
{
	tnode * temp= new tnode();
	temp->read=0;
	temp->write=0;
	temp->assign=0;
	temp->val=0;
	temp->op=0;
	temp->left=l;
	temp->right=r;
	return temp;
}

tnode* makeid(char c)
{
	tnode * temp= new tnode();
	temp->read=0;
	temp->write=0;
	temp->assign=0;
	temp->val=0;
	temp->op=c;
	temp->left=NULL;
	temp->right=NULL;
	return temp;	
}

tnode* readnode(char p)
{
	tnode * temp= new tnode();
	temp->read=1;
	temp->write=0;
	temp->assign=0;
	temp->val=0;
	temp->op=p;
	temp->left=NULL;
	temp->right=NULL;
	return temp;
}

tnode* writenode(tnode* t)
{
	tnode * temp= new tnode();
	temp->read=0;
	temp->write=1;
	temp->assign=0;
	temp->val=0;
	temp->op=0;
	temp->left=NULL;
	temp->right=t;
	return temp;
}

tnode* makeleaf(int n)
{
	
	tnode* temp= new tnode();
	temp->read=0;
	temp->write=0;
	temp->assign=0;
	temp->op=0;
	temp->val=n;
	temp->left =NULL;
	temp->right =NULL;
	return temp;
}

tnode* makeop(char c, tnode*l, tnode*r)
{
	tnode *temp= new tnode();
	temp->read=0;
	temp->write=0;
	temp->val=0;
	temp->op= c;
	if(c=='=')temp->assign=1;
	temp->left=l;
	temp->right=r;
	return temp;
}


void print(tnode*t)
{
	cout<<"i'm travelling \n";
	if(t==NULL) return ;
	if(t->read)
	{
		cout<<"i'm in the read node\n";
		return ;
	}
	else if(t->assign)
	{
		cout<<"i'm in the assign node\n";
		return ;
	}

	else if(t->write)
	{
		cout<<"i'm in the write node\n";
		return ;
	}

	else if((t->read==0)&&(t->write==0)&&(t->assign==0)&&(t->op==0))
	{
		cout<<"i'm in the internal node\n";
		print(t->right);
		print(t->left);

		
		
	}
	return ;
}

void final(tnode* t)
{
	if(t==NULL)
		return ;
	if(t->read)
	{
		//you have to read the memory = t->op;
		cin>>memory[t->op-'a'];
	}
	else if(t->write)
	{
		tnode* temp=t;
		cout<<evaluate(temp->right)<<endl;
	}
	else if(t->assign)
	{
		tnode* temp=t;
		memory[(temp->left)->op-'a']=evaluate(temp->right);
	}
	else if((t->read==0)&&(t->write==0)&&(t->assign==0)&&(t->op==0))
	{
		final(t->right);
		final(t->left);
	}
	return ;
}
/*
a=3;read(b);write(a+b);
*/


int evaluate(tnode* t)
{
	if(t==NULL)
		return 0;

	if(t->op==0) return t->val;
	else 
	{
		switch(t->op)
		{
			case '+' : return evaluate(t->left)+evaluate(t->right);break;
			case '-' : return evaluate(t->left)-evaluate(t->right);break;
			case '*' : return evaluate(t->left)*evaluate(t->right);break;
			case '/' : return evaluate(t->left)/evaluate(t->right);break;
			default : return memory[t->op-'a'];
		}
	}
}