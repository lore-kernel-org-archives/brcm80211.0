Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752681EEA5D
	for <brcm80211@lists.linux.dev>; Tue, 15 Jul 2025 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586918; cv=none; b=k36AFLtz+sAPTwAy8qKlsaiTc9/t/ALhBwl8Dx26iOGrTbDYooMw1jX8P3y4wP7WfWM7tJp0fbcsTotVEePQJ2qEZZPFOgZ6FErk75WRKEj5aL2k4jc0YHsCwkvHktLPSdGX3x8sRF+tqer+fzhU/slfUb6uk5k9Ai0FMhzvzDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586918; c=relaxed/simple;
	bh=7dSG76ruHEHqbRjXtpbZP2fQrkMNdrnwG4/ymtpfEKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bxo5Yjz2rNTUKgazQxcsfF07GUFDRgLVnu3ZpRkj8Dukz3WRBCx1kHLzJ1sMWuGB3HlIPqT1ojPS6J6rAd6vY1n+pswnhcE9t7QoOmnZ+zYGjxGbuKy44+HiO0bc2tIITShUfx3ybTW4mQrsz7F1rMREYfRn/IUJLe3GfjUTAjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=FuSGLnLw; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="FuSGLnLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752586877;
	bh=DYh+6PDIK8SljIBmyMHrXvBMyc6UvyjoLxtRvLKcLYw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FuSGLnLwCgAHTPyGVASWNIky64prQYBGC23iLTwJaxSXF2msqdPe5oYgoHClHMjNJ
	 5jf6pn/sdZvM2ROoK0aOG8bcnlxOzGOhJhgJVveAYgoF3H4us4KUN8Hiz2cHR4q8Yp
	 EkZeBNRjaS9QdvY/QRZfUBTVHqYWXKOCZC3PZvZ8=
X-QQ-mid: zesmtpip4t1752586865t2a0dea2e
X-QQ-Originating-IP: vd1RqZ1Qgxy/7VfOTmQ9xNBTBKWDttmC7/G/8c4FLA8=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 21:41:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13011556839216271353
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	marcin.s.wojtas@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	arend.vanspriel@broadcom.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	ming.li@zohomail.com,
	linux-cxl@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org,
	kvalo@kernel.org,
	johannes.berg@intel.com,
	quic_ramess@quicinc.com,
	ragazenta@gmail.com,
	jeff.johnson@oss.qualcomm.com,
	mingo@kernel.org,
	j@jannau.net,
	linux@treblig.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	shenlichuan@vivo.com,
	yujiaoliang@vivo.com,
	colin.i.king@gmail.com,
	cvam0000@gmail.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH v2 0/8] treewide: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:40:50 +0800
Message-ID: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OK0361LY/LXI8nlvspYlQFyqRrCjzyXqkN5hP7+ojw5/gb7lp68kF2Uk
	p1oClLbudbSJR3P8x8PW/7LNwwJ+hR2Hvavz4eCbd6BVdGRAoI1D5C0QoztMX1laDwCONbX
	6weFSI/xb4cvdsxW4Bak3I3uQR/3ClRwChlzk41AV3nH4wmRzkYGBEJ1ocIe849pcu0Vo/g
	jpim2OSAhgWz3M69ChCJcd2Hahig3apZi9l5ekG4VyAokkGN53A0V1qZ5YCI8RG/lQ5l/Hh
	iiBNsQnfBkRGwRtabZ9Ein8ApiG46wFSuyrHiPOZoIbJMhL2SnH1+c2D7qTCF+qgsDUXMLc
	xk2sK6DJ9Xfd41DXWqhkwLMLYLpZZ7c8q5ufIEgsnLtx1UWWeO72sZt+7TAIMOz7/JVQ8sC
	9RBt+HfearMkGGpCJRpeuotFbx9RA7qIv9LAdav7unk/lVf90IRMz/I2L6HdTWY0fucefUh
	NR5HHu+xRyLyZ04OWCvd52dsinwZ1mdc05uQbrWGSBWDWKsr+a1ujpmCizijtN3++0S8icp
	Am540IA5vTPLeNZNPIMLGQ5fblSy+hk2rOcxnVsrLSWBsldPKR82erUEzSqqoMQtXCbCSIw
	O4vGo23XycL7UGq2LmmuguaSuqUizXkLUSU9oJGZ079of2Z/TbzJZnh2+RI8qYzJxTsov4z
	maK0O0L5xileDIw0ERX8Ifv6/rEOhbd74ObslvwGTg3sTvt/xFQ2HW+rBBiZabiUdEsmWlZ
	+4sl7IwkAJW+W9D3+ozkmcenGJfUv7q4/Zgx2d2+g/ovDZEqdB1YL4MucZWfwbikbcR0M2n
	U3lkTDMzvRByPHoqiizNWGNZgoWDNMN6KMJpc/GF2mQk6iLSaz/FAnhwVaC7d+ziJufJSuK
	wuH1RnHlcKBlzkc7hpXB7M54uo/gbSo1U/Q3QtyKsQB+hJwe3CxBKZtAI84ZOSCrXvxdFsr
	IaXJludiZevFD0sLatMdcjWxjYVQrl3G0Nmk7XO6UWspEgIQr+p3vwYbaDjRNElFEeud+FT
	/+TLcfBnvL4Znjcqwqj5VCsm0dMKRuIE5z4IaUS/I4mw4BO8o8Wtpwipw2b08EzlIftEABl
	1uMAIsZQvx3eAnQ6HSD9lk=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

There are some spelling mistakes of 'notifer' in comments which
should be 'notifier'.

Fix them and add it to scripts/spelling.txt.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/

WangYuli (8):
  KVM: x86: Fix typo "notifer"
  cxl: mce: Fix typo "notifer"
  drm/xe: Fix typo "notifer"
  net: mvneta: Fix typo "notifer"
  wifi: brcmfmac: Fix typo "notifer"
  serial: 8250_dw: Fix typo "notifer"
  xen/xenbus: Fix typo "notifer"
  scripts/spelling.txt: Add notifer||notifier to spelling.txt

 arch/x86/kvm/i8254.c                                        | 4 ++--
 drivers/cxl/core/mce.h                                      | 2 +-
 drivers/gpu/drm/xe/xe_vm_types.h                            | 2 +-
 drivers/net/ethernet/marvell/mvneta.c                       | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 drivers/tty/serial/8250/8250_dw.c                           | 2 +-
 include/xen/xenbus.h                                        | 2 +-
 scripts/spelling.txt                                        | 1 +
 8 files changed, 9 insertions(+), 8 deletions(-)
---
Changelog:
 *v1->v2: Break patch v1 up into one-patch-per-subsystem.

-- 
2.50.0

