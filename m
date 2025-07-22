Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A206A2248A3
	for <brcm80211@lists.linux.dev>; Tue, 22 Jul 2025 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169837; cv=none; b=lrnpWLXFVdDtJ+Dqe0MoVxXqwxp/oXOtugpceeMSrt7GiR+i9KuJUzqDbYZ/XLgARkPLh+mhg8GyhdrvOYKc9mb2E3ff8WZPAvNSqNC7EBn5A+KiI3uepfrr5oCjDsMA1p+IZfC96taMd0RCm0CKrsNeLhU1G3OGn7rkkj885XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169837; c=relaxed/simple;
	bh=pif+UloRwSr0Am2GfxtN6NiAOi/V8GWq84r2WOxYR0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgGvrFjVo3Vve6M/WW0c8DfEPKueDLCdFGyj5FY3fJqtezKB01vpXzVP5V/Q2tOFON9Dvw2mM5WPxVR8eYTYCBqMJ4YDOe64FxMbovOmNoxNAPIuBrxEq0XVhbA22MUBjr7D1swflQlcODOYhnGwonEXZ7NEDFZdRshB9kh1vcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=bWMI3G2t; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="bWMI3G2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753169790;
	bh=vYmY+9tqPioPK6cSdujQjMbixbob4YHFsEPo+u1e8jk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=bWMI3G2tg2sQ9TLlEb/YhuFjuscFDegOce5lLCzYm5nVtlxwel+1d6njCILzlmJ+h
	 5O1nt+gP9NfvaOse7fagdnf1XvO8MsPnxG3Kx60lKVs39s0nsso3iu+m7wysyb5kQZ
	 nanlWLFBJsPeTGmJLDzVKPEzoFt9vOI9y0Exqj0s=
X-QQ-mid: zesmtpip2t1753169729tcf86fa72
X-QQ-Originating-IP: HNLldTyG1udNmPKueSkK9C3LgPlbsP2VGGl0nQkGM08=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Jul 2025 15:35:25 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14499228657243384026
EX-QQ-RecipientCnt: 64
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
	wangyuli@deepin.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com
Subject: [PATCH v3 7/8] xen/xenbus: Fix typo "notifer"
Date: Tue, 22 Jul 2025 15:34:30 +0800
Message-ID: <C6633C66376C709A+20250722073431.21983-7-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
References: <576F0D85F6853074+20250722072734.19367-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N0PzTgVEUVk2ub/nyTM0nfY4845ERu7wWdm72JrCdkWIDuDLA+ddACqX
	LcFDIMiFRiUk8gLGqlmDsRmrsVX1NToF+rMnRodFsm1NKtrWc9F12vsvtGxVWYdRokT3plj
	bXSTyvGzthcG9HyDAsrlReNW+BxYwI4ElqdL9eGMAWbmckaRtCeCyCltIJ6iUNfG1p3bVZu
	mQr63FMntQD02A/LI6t+xVPVlBo2dlC94FlYy8nNdNIXdY0T3H4Khtc6wEhk9Oy0AvswOF0
	oUsQsktM8rQiXCjloxgQX7C9INjKteCL83GMTCQw+Ba2pBtXVaOXw3hCdRIMZrci/i9rwi7
	yyxLntkzfyrQwETfx7vOqNnMxJ1kYIazDpjVD+eEa3luXOv3IQgUygm6QxFzy8akuSRhrj1
	2X5uunADEfUb2wQwDW+plfZsVSbo8fFwAU3TiTADq6FH+QiZIi/YrX5gv8xn+0aqWdMogFG
	cGHzyRci2kmKuCvHDuDzKb7Jq4bXbZwoiGjQheBv2Hn0RG+9hEJPhXt4rnU2j8p9v8wZGZB
	wQO5dL2QSHrTSURQ+C3Gh2YfYDyfTpqSCkyutTD7WCqPN2GlcBy+imoI/ttMTPkPRL81QMM
	6kPrlCRRNAltMNJuaEEk5x/dcwc2l6FgFZ/dBmAO8pdk2Qv4vZBgSqi5qyanLqthaXxR78B
	n6KnYqPtGTiSZSe3LFr8P4ayiyShZK5mHFC822Fj0wq53lYFSXFc1QrglPmL+HYz9YprcAF
	U61Z1QbXG/xB4dzPMaAsoaVCcjUxAGnmcsXP9mkxXJDaIl9LSFdhyGAiqgDuaNvlm01lu4u
	GWD7C5k3XLbHQgj/ulkl7rovYDLFh+XkpVTMBcdrYbF1bFPv7YmD5WflVwCKurGAbjy81eP
	i/skcv/bptudW/qT7hvTpP4I8c/P0JKbOfsFt/9aG2x1ECjoCUWX4e35s0U1pHptdFi3Dib
	hthtBOmJ5zs44pSZJ8D3pmwlLSnyZ06imQNZL8DYFGCW4lGZ111C4DY92CpkPPOMc258yR/
	kGTV6NK0RKgcS4su+5SPxlrLlENbGUNUSCUX0x+7+LJI0/Bq6k27c52zZT0YmFWx1JpNRHO
	D1zYQOFDu8daZSb1dE9m3hZRi/1XF2yoDkI/sL3eN7+KLwhzDV9hXSGOEhYXmUlDg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'notifer' in the comment which
should be 'notifier'.

Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 include/xen/xenbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 3f90bdd387b6..00b84f2e402b 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -180,7 +180,7 @@ int xenbus_printf(struct xenbus_transaction t,
  * sprintf-style type string, and pointer. Returns 0 or errno.*/
 int xenbus_gather(struct xenbus_transaction t, const char *dir, ...);
 
-/* notifer routines for when the xenstore comes up */
+/* notifier routines for when the xenstore comes up */
 extern int xenstored_ready;
 int register_xenstore_notifier(struct notifier_block *nb);
 void unregister_xenstore_notifier(struct notifier_block *nb);
-- 
2.50.0

