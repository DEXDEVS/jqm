<?php 

    $userID = Yii::$app->user->id;
    $user = Yii::$app->db->createCommand("SELECT user_photo FROM user WHERE id = $userID")->queryAll();
    // Student Photo...
    $userPhoto = $user[0]['user_photo'];
?>
<style type="text/css">
    .main-sidebar{
        color: #ECF0F5;
        background-color: #001F3F;
    }
    .main-sidebar a{
        color: #ECF0F5;
    }
    .sidebar a:hover{
        font-weight: bold;
        background-color: #000000;
        color: #ffffff;
    }
</style>
<aside class="main-sidebar">

    <section class="sidebar" style="overflow-y: visible; ">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo '../frontend/web/'.$userPhoto; ?>" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>
                    <?= Yii::$app->user->identity->username ?>
                    <!--  -->
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <!-- <div class="input-group">
                <input type="text" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div> -->
        </form>
        <!-- /.search form -->
        <?php if(Yii::$app->user->can('navigation')){ ?>

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    // ['label' => 'Menus', 'options' => ['class' => 'header center']],
                    ['label' => 'Home', 'icon' => 'dashboard', 'url' => "./home"],
                    //['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii']],
                    ['label' => 'Login', 'url' => ["../login"], 'visible' => Yii::$app->user->isGuest],

                    // ------------------------------------------------
                    // Student Module start...
                    [
                        'label' => 'Students',
                        'icon' => 'graduation-cap',
                        'url' => '#',
                        'items' => [
                            //['label' => 'Inquiry', 'icon' => 'caret-right', 'url' => ["/std-inquiry"],],
                            ['label' => 'Registration', 'icon' => 'caret-right', 'url' => ["/std-personal-info"],],
                            ['label' => 'Attendance', 'icon' => 'caret-right', 'url' => './attendance',],
                            ['label' => 'Exams Report', 'icon' => 'caret-right', 'url' => './exams-report',],
                        ],
                    ],
                    // ------------------------------------------------
                    // Employee Module start...
                    [
                        'label' => 'Employees',
                        'icon' => 'users',
                        'url' => [""],
                        'items' => [
                            ['label' => 'Employee Registration', 'icon' => 'caret-right', 'url' => './emp-info',],
                            // ['label' => 'Assign Teacher', 'icon' => 'caret-right', 'url' => './teacher-subject-assign-head',],
                            // [
                            //     'label' => 'Attendance Management',
                            //     'icon' => 'cancel',
                            //     'url' => '#',
                            //     'items' => [
                            //         ['label' => 'Manage Attendance', 'icon' => 'chevron-right', 'url' => './emp-attendance',],
                            //          ['label' => 'Final Attendance', 'icon' => 'chevron-right', 'url' => './final-attendance',],
                            //         [
                            //         'label' => 'Attendance Report',
                            //         'icon' => 'list',
                            //         'url' => '#',
                            //         'items' => [
                            //                 ['label' => 'Single Employee', 'icon' => 'chevron-right', 'url' => './emp-att-report',],
                            //                 ['label' => 'All Employees', 'icon' => 'chevron-right', 'url' => './employess-att-report',],
                            //             ],
                            //         ],  
                            //     ],
                            // ],
                            // [
                            //     'label' => 'Leave Management',
                            //     'icon' => 'cancel',
                            //     'url' => '#',
                            //     'items' => [
                            //         ['label' => 'Manage Leave', 'icon' => 'chevron-right', 'url' => './emp-leave',],
                            //         ['label' => 'Leave Report', 'icon' => 'chevron-right', 'url' => './premium-version',],
                            //     ],
                            // ],

                            // ['label' => 'Payroll System', 'icon' => 'caret-right', 'url' => './premium-version',],
                            // ['label' => 'ID Cards', 'icon' => 'caret-right', 'url' => './premium-version',],
                            // ['label' => 'Promotion/Demotion', 'icon' => 'caret-right', 'url' => './premium-version',],
                            // ['label' => 'Announce Jobs', 'icon' => 'caret-right', 'url' => './premium-version',],
                        ],
                    ],
                    // ------------------------------------------------
                    // Msg of Day start...
                    // [
                    //     'label' => 'Communications',
                    //     'icon' => 'comments',
                    //     'url' => '#',
                    //     'items' => [
                    //         ['label' => 'Message of the Day', 'icon' => 'caret-right', 'url' => "./msg-of-day"],
                    //         ['label' => 'Events Management', 'icon' => 'caret-right', 'url' => "./events"],
                    //         ['label' => 'Notice Management', 'icon' => 'caret-right', 'url' => "./notice"],
                    //         ['label' => 'Complaint Box', 'icon' => 'caret-right','url' =>"./premium-version"]
                    //     ],
                    // ],
                    // ------------------------------------------------
                    // System Settings start...
                    [
                        'label' => 'System Settings',
                        'icon' => 'cogs',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Institute', 'icon' => 'caret-right', 'url' => ["/institute"],],
                            ['label' => 'Branches', 'icon' => 'caret-right', 'url' => ["/branches"],],
                            ['label' => 'Classes', 'icon' => 'caret-right', 'url' => ["/std-class-name"],],
                            ['label' => 'Paraay', 'icon' => 'caret-right', 'url' => ["/paraay"],],
                        ],
                    ],
                    // System Settings close...
                    // ------------------------------------------------
                    // SMS start...
                    [
                        'label' => 'Phone Book Directory',
                        'icon' => 'phone-square',
                        'url' => 'phone-book',
                    ],
                    
                ],
            ]
        ) ?>
        <?php } ?>

    </section>

</aside>
