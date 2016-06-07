//
//  TableViewController.m
//  多选demo
//
//  Created by xiantian on 15/12/17.
//  Copyright © 2015年 xiantian. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()


@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) UIButton *button ;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = @[@"第1条",@"第2条",@"第3条",@"第4条",@"第5条",@"第6条",@"第7条",@"第8条",@"第9条",@"第10条"];
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, 100, 30);
    [self.button setTitle:@"点选择后全选" forState:UIControlStateNormal];
    self.button.enabled= NO;
    [self.button addTarget:self action:@selector(chooseAllCell) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = self.button;

    
}
-(void)chooseAllCell{
    
    //    NSArray *arr = [self.tableView indexPathsForVisibleRows];
    //找到所有的indexPath
    NSArray *arr = [self.tableView indexPathsForRowsInRect:CGRectMake(0, 0, self.view.frame.size.width, self.tableView.contentSize.height)];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.tableView selectRowAtIndexPath:obj animated:YES scrollPosition:UITableViewScrollPositionNone];
    }];
    
    
    
    
//  这段代码是为了表示 选择之后， 对于所有选中的cell中的一个处理， 目的是为了拿到，cell中自己想要拿到的数据。
    
//    NSMutableString * tamdestring =[NSMutableString string];
//
//    for (NSIndexPath *indexP in arr) {
//        
//        NSString * mystring = self.dataArr[indexP.row];
//        
//        [tamdestring appendFormat:@"%@,",mystring];
//        
//        //      appendFormat 这个方法就是用来表示 在一个可变的字符串尾插入另个字符串生成一个新的字符串
//        
//        NSLog(@"%@",tamdestring);
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text= self.dataArr[indexPath.row];
//    cell.selectionStyle = UITableViewCellStyleSubtitle;
//        cell.backgroundView.backgroundColor = [UIColor clearColor];
    return cell;
    
//    其实我也不知道为什么写这段注释，但是明明中有个声音在呐喊， 写下来吧， 然后我就写了下来，其实我想写的什么东西我也不知道， 但是我就是想试试这个插件好不好用啊
//    嗯 ， 还有就是 今天星期五了，觉得自己好开心，，窗外的天气不错， 还有阳光， 迷迷瞪瞪的， 中午没有睡午觉
//    嗯， 为啥我不干活呢， 因为啊，我真的是不想干活啊， 20分钟能干完的 ， 是我今天剩下的工作量了， 那么我还需要干啥？ 不能省下的时间就玩吧， 都特么周五下午了， 真的不想啊
//    嗯， 反正再写个demo， 封装一个抽屉式的tableview出来， 以后可能用的上
    
    
}

- (IBAction)bianjibutton:(id)sender {
    [self.tableView setEditing:(!self.tableView.editing) animated:YES];
    self.navigationItem.rightBarButtonItem.title = self.tableView.editing ? @"取消":@"选择";

    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"选择"]) {
        self.button.enabled= NO;
    } else {
        self.button.enabled =YES;
    }
}
- (IBAction)savebutton:(id)sender {
    //    拿到现在是选择状态的indexP数组。。
    //    /*
    //     **这个属性方便了太多！
    //     */
  NSMutableString * tamdestring =[NSMutableString string];
    NSArray *arr = self.tableView.indexPathsForSelectedRows;
    //此处从数组删除注意：按照arr 顺序删除会造成越界崩溃、、
    for (NSIndexPath *indexP in arr) {
        
        NSString * mystring = self.dataArr[indexP.row];
        
        [tamdestring appendFormat:@"%@,",mystring];
//      appendFormat 这个方法就是用来表示 在一个可变的字符串尾插入另个字符串生成一个新的字符串
        
         NSLog(@"%@",tamdestring);
        
//       [self.delArray addObject:mystring];
//        
    }
    
//    NSLog(@"%@",self.delArray);
    
}

//允许编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//实现如下委托
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//     NSString * myuserid = self.dataArr[indexPath.row];
////    NSLog(@">>>>>>>%@",myuserid);
//    
//    if (tableView.editing) {
//        
//        
//        [self.delArray addObject:myuserid];
//         NSLog(@"<<<<<<<<%@",self.delArray);
//    }
//}
////
////取消选中时 将存放在self.deleteArr中的数据移除
//
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//     NSString * myuserid = self.dataArr[indexPath.row];
//    
//    if (tableView.editing) {
//        
//        [self.delArray removeObject:myuserid];
//       NSLog(@"!!!!!!!!!!!%@",self.delArray);
//    }
//
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
