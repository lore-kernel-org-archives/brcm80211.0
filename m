Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8A2ECE80
	for <brcm80211@lists.linux.dev>; Tue, 15 Jul 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587165; cv=none; b=aAuXHsUnH475D5aqnvqrWKuUftAnaY4d3g5fVKYkatouvWdcQ8/AdIPDmpUcs9SZ8WHBkg1bc1vvIOvLqrrYj/53kB6RdMcJ8eN6GltABfRrb9AgUF+Du4NLMD33EhpAr44Ui0VZNU6KoTtHEYAmnH4zFL6aKovEbx0P+IQItIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587165; c=relaxed/simple;
	bh=PESbSQ2riBmWnB3ifW6iRWmYUAMSpluf1ck6gekndAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dr2XiEeNdUn6XAdZjYcpwbXKBFylewC/kjRA4kSHY55iYFUhjvnM384BzX8m6PYGe+AuvUInI9RcePfwTbqmwJn3seFhxU3C970f3iHibMvV/XR3f3Mmeffe7M1Q90jqVG4XSfbaWudpFsAGVIr8/H/eCeMKUqq4BuhCuqzg7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dt/d39U/; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dt/d39U/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587127;
	bh=DQOAtGRHzOhokt1byV1hDfgfMVfreeOvNYgUQQUEI+w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dt/d39U/JvCGRYvJywjrnl6l+GFiWSoghBEC8LTHxqR9Qje6oIFcAkRizOqLdSzXs
	 GMHBh5+6oynlPBWuLPdwN8DzoqGlX+xfe8PDbLUefu65zP9IgoIjFczk1dMH/QJHiX
	 Fa3X5qoKmbn21HWedq5TPEsnWWmhrHTAmkKDcYFU=
X-QQ-mid: zesmtpip2t1752587114t4242d337
X-QQ-Originating-IP: bUZPMnhKZ8NU12puD/0nV8FvyCDfWloR8Qvt76r6nV8=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 21:45:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17289734867236313614
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com,
	akpm@linux-foundation.org,
	alison.schofield@intel.com,
	andrew+netdev@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	arend.vanspriel@broadcom.com,
	bp@alien8.de,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	colin.i.king@gmail.com,
	cvam0000@gmail.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	davem@davemloft.net,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	guanwentao@uniontech.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com,
	j@jannau.net,
	jeff.johnson@oss.qualcomm.com,
	jgross@suse.com,
	jirislaby@kernel.org,
	johannes.berg@intel.com,
	jonathan.cameron@huawei.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	kvm@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux@treblig.org,
	lucas.demarchi@intel.com,
	marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com,
	mingo@kernel.org,
	mingo@redhat.com,
	netdev@vger.kernel.org,
	niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com,
	pabeni@redhat.com,
	pbonzini@redhat.com,
	quic_ramess@quicinc.com,
	ragazenta@gmail.com,
	rodrigo.vivi@intel.com,
	seanjc@google.com,
	shenlichuan@vivo.com,
	simona@ffwll.ch,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com,
	vishal.l.verma@intel.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com
Subject: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:05 +0800
Message-ID: <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NYuZLBhQBuqvZPqTaA6eCRNOw1rsjH/1V0incXI0TTkXhIqjT7OcyVpB
	U4BwUK7IzVbCUS+z9mPFOXnqeyiiIwmM3D5JHQyd+IBkFoGpDBTfRxU982pmEMODO1iaxKY
	D48NOO0SiNjVs8fA9CcJ+qADBbnc+Qq6wEfJEREPTT54OKcldJY9fVxNhnH6sFSyZdZr1r+
	QhZ+SFC4XDjSNOFewsNqmG1gdtoI5qlIjUH3jOpiv7hjFQnZ/rHku2YFBeJUI9wgQu/EZ2g
	1SHvFKk7b4+awytyd6trjgbB00PeVMLjlfrTxj9kxoHbCtD928FdzMZo2Gtnt+xtZyi9vdd
	xmxCmPa1+SWXVGMJElU6ck0QgB6Gu96yBRNEfs4KoC12IgmPa8C6kyrhBLpeLsL0BQfh8DW
	rmvUy+khQwMdaV2duDMxGBqB6u+dGdAcZp2JbS/blmkcJXaAx1f/mmFinZVe6tyqB7GVobX
	8/pako5aZr+woWT+p9txzW2E5uSmir4xXa1u1zVyTCGk2TtJdeZe5u3JPxrq0Bw5QGG/DUM
	FZWj5jTkINwLqHc0UrudOSiQ3uABt53gye9gBlFEanwVKt8dCe/RuDHOVnzHob0VTXzeXG1
	LonRGyEjbzoOkl/Iq8WlEqSv7mm91gapRqeIv9tTSYdljJSr6+I7S0mo5+o1QSDHQiVzktm
	PA1h8R0OREJoJfygD1WNfmzH1b/KltS8ePC9yAeJXq3WoLJEbO+1dAX0MX1n1JEleDlZpXL
	YMDRU81uTsLV6Zd9gywX8FGcu9RhBTw6RLR1kK4DXtAOEeECV0iZE2UNGXpWUKoNsKVspzi
	3bIBCVfcK6GnIX2R45rvjdHh82MP4jIVrPHIOovNuC0R5+uNV1ZAWzCpVGc8iQHEcY/wXAe
	ymu5iDY28lWKG+hHKuvDrTAzpGr/6cIe7xlq+IQge73r9PjfXPp/qx6bSuF3QnyvKq5C97h
	1Pa9z/dsdW6qzlVBgSAT6g8T6asn4XPy97OzJbneZfv6yu+3LicvLYJi50aGC0JDgQb3/eB
	LGINhlHiuRFPDJYACemTkiooy1LjK0y5rkmmrwRe7Gr9CIoLmnfnDjDPtqoRKTAFPa+FnsD
	6JUUZK/LCruGk7cYsWkCUM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/tty/serial/8250/8250_dw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1..6d9af6417620 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -392,7 +392,7 @@ static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	rate = clk_round_rate(d->clk, newrate);
 	if (rate > 0) {
 		/*
-		 * Note that any clock-notifer worker will block in
+		 * Note that any clock-notifier worker will block in
 		 * serial8250_update_uartclk() until we are done.
 		 */
 		ret = clk_set_rate(d->clk, newrate);
-- 
2.50.0

