import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amid_app/server/post.dart';

class UserNewsFeedPsge extends StatefulWidget {
  Map user;
  String role;
  GlobalKey<ScaffoldState> scaffkey;
  UserNewsFeedPsge({this.user,this.role,this.scaffkey});
  @override
  State<StatefulWidget> createState() {
    return UserNewsFeedPsgeState();
  }
}

class UserNewsFeedPsgeState extends State<UserNewsFeedPsge> {
  int currentIndex=0;
  List posts;
  int like;
  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  removePost(index){
    setState(() {
      posts.removeAt(index);
    });
  }
   _getPosts() async{
    Map response =await Post().getUserPost(widget.role,widget.scaffkey);
     if(response['status']==200){
       setState(() {
         posts=response['data'];
         currentIndex=1;
       });
     }else{
       setState(() {
         currentIndex=0;
       });
     }
  }
  @override
  Widget build(BuildContext context) {
     return 
       currentIndex == 0
       ?Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           Text(''),
           Center(child: Text('در حال بارگذاری...')),
           LinearProgressIndicator()
         ],
       )
       :ListView.builder(
         itemCount: posts.length,
         itemBuilder: (BuildContext context, int index) {
           return PostBody(post:posts[index],user:widget.user,scaffKey:widget.scaffkey, removePost : removePost, index : index);
         },
       );
  }
}




  
class PostBody extends StatefulWidget{
  Map post;
  Map user;
  int index;
  final removePost;
  GlobalKey<ScaffoldState> scaffKey;

  PostBody({this.post,this.user,this.scaffKey,this.removePost, this.index});
  @override
  State<StatefulWidget> createState() {
    return PostBodyState();
  }
}

class PostBodyState extends State<PostBody>{
  bool liked;
  List likesId;
  int likeCount;
  int allowLike;
  bool edit;
  String postBody;
  TextEditingController _textEditingController;
  GlobalKey<FormFieldState> textFormFieldKey = new GlobalKey();
  @override
  void initState() {
    super.initState();
    postBody=widget.post['body'];
    allowLike = 0;
    edit=false;
    likesId = widget.post['likes_id'];
    
    widget.user != null
    ? liked= likesId.contains(widget.user['id'])
    : liked=false;
    likeCount = widget.post['likes_count'];
  }  
  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment : CrossAxisAlignment.stretch,
              children: <Widget>[
                  Column(
                    children: <Widget>[
                            new Padding(
                                  padding: const EdgeInsets.fromLTRB(16.0 , 16.0, 8.0, 16.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(left : 8.0),
                                            height: 40.0,
                                            width: 40.0,
                                            child: CachedNetworkImage(
                                                   imageUrl: widget.post['userImage'],
                                                   ),
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Text(
                                            "${widget.post['user']}",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      widget.user != null
                                      ?widget.user['id'] == widget.post['userId']
                                        ?PopupMenuButton(
                                          icon:Icon(Icons.more_vert),
                                          onSelected: (value){
                                             switch (value) {
                                               case 'edit':editPost();
                                                 break;
                                               case 'delete':showDialog( 
                                                             context: context,
                                                             builder: (BuildContext context)=>AlertDialog(
                                                               title: Text('حذف پست'),
                                                               content: Text('از حذف این پست مطمئن هستید؟'),
                                                               actions: <Widget>[
                                                                 FlatButton(
                                                                   child: Text('لغو'),
                                                                   onPressed: () {
                                                                     Navigator.of(context).pop(false);
                                                                   },
                                                                  ),
                                                                 FlatButton(
                                                                   child : Text('حذف'),
                                                                   onPressed: ()async {
                                                                    Navigator.of(context).pop(false);
                                                                    final status=await deletePost(widget.post['id']); 
                                                                    if(status == 200){
                                                                      widget.removePost(widget.index);
                                                                      widget.scaffKey.currentState.showSnackBar(
                                                                        SnackBar(
                                                                          content: Container(
                                                                            height: 80,
                                                                            child:Text('پست شما با موفقیت حذف شد'),
                                                                          )
                                                                        )
                                                                      );
                                                                    }else{
                                                                      widget.scaffKey.currentState.showSnackBar(
                                                                        SnackBar(
                                                                          content: Container(
                                                                                    height: 80,
                                                                                    child:Text('عملیات با خطا مواجه شد'),
                                                                                  )
                                                                        )
                                                                      );
                                                                    }
                                                                   },
                                                                  ),
                                                               ],
                                                             )
                                                            );
                                                 break;
                                               default:
                                             }
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return [
                                               PopupMenuItem(child: Center(child: Text('ویرایش',style: TextStyle(fontSize: 13),),),value: 'edit',),
                                               PopupMenuItem(child: Center(child: Text('حذف',style: TextStyle(fontSize: 13),),),value: 'delete',)
                                            ];
                                         },
                                        )
                                        :Text('')
                                      :Text('')
                                    ],
                                  ),
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Expanded(
                                        child: CachedNetworkImage(
                                                   imageUrl: widget.post['imageUrl'],
                                                   fit: BoxFit.cover,
                                                   ),
                                    )
                                  ],
                                ),
                                new Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Row(
                                        children: <Widget>[
                                           widget.user != null
                                           ?IconButton(
                                              icon:Icon(
                                              liked ==false  
                                              ?FontAwesomeIcons.heart
                                              :FontAwesomeIcons.solidHeart,
                                              color:
                                              liked ==false
                                              ?Colors.black
                                              :Colors.redAccent
                                              ),
                                              onPressed: (){
                                                setState(() {
                                                  allowLike++;
                                                  if(allowLike < 5){
                                                    liked = !liked;
                                                    liked ? likeCount++ : likeCount--;
                                                    Post().like(widget.post['id']);
                                                  } 
                                                });
                                              }
                                             )
                                           :Text(''), 
                                          Text('${likeCount}  نفر این پست را پسندیدند',style: TextStyle(fontSize: 12),),
                                          // new IconButton(icon: new Icon(FontAwesomeIcons.comment , color: Colors.black), onPressed: null),
                                          // new IconButton(icon: new Icon(FontAwesomeIcons.paperPlane , color: Colors.black), onPressed: null)
                                        ],
                                      ),
                                          Text("${widget.post['created_at']}" , style:  TextStyle(color: Colors.grey,fontSize: 12),),
                                        // new IconButton(icon: new Icon(FontAwesomeIcons.bookmark, color: Colors.black), onPressed: null)
                                    ],
                                  ),
                                ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8,0,14,10),
                                      child: 
                                      edit == true
                                      ?Column(
                                        children: <Widget>[
                                          TextFormField(
                                            textDirection: TextDirection.rtl,
                                            key: textFormFieldKey,
                                            validator: (String value){
                                              if (value.length < 5) {
                                                return 'متن نمیتواند کمتر از یک کاراکتر باشد';
                                              }
                                            },
                                            style: TextStyle(
                                              
                                              fontSize: 13
                                            ),
                                            autofocus: true,
                                            maxLines:10,
                                            initialValue: postBody,
                                            controller: _textEditingController,
                                           ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                              OutlineButton.icon(                                              
                                              onPressed: () {
                                                 updatePost(widget.post['id']);
                                                 setState(() {
                                                  edit=false; 
                                                 });
                                              },
                                              label: Text('ارسال',style: TextStyle(fontSize: 12)),
                                              icon: Icon(Icons.edit),

                                          )

                                              ],
                                             )
                                        ],
                                      )
                                      :Text('${postBody}',style: TextStyle(fontSize: 13),textDirection: TextDirection.rtl,),
                                      
                                    ),   
                          ],
                  ),
                  Divider(),
              ],
            );       
  }

  deletePost(post_id) async{
    final status=await Post().deletePost(post_id);
    return status;
  }

  editPost(){
   setState(() {
    edit =true; 
   });
  }

  updatePost(post_id) async {
    if(textFormFieldKey.currentState.validate()){
     String newValue=textFormFieldKey.currentState.value;
     final status= await Post().updatePost(post_id, textFormFieldKey.currentState.value);
     if(status == 200){
       setState(() {
         postBody=newValue; 
       });
       widget.scaffKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Container(
                                          height: 80,
                                          child:Text('ویرایش با موفقیت انجام شد'),
                                        )
                                      )
       );
     }else{
              widget.scaffKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Container(
                                          height: 80,
                                          child:Text('ویرایش با خطا مواجه شد'),
                                        )
                                      )
       );            
     }
    }
  }
}

