Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6452ED16E
	for <brcm80211@lists.linux.dev>; Tue, 15 Jul 2025 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587117; cv=none; b=o8bUC27YuArGa8alKGp81c8oRUrwyVc5kY9oH9Pb8kNSWBB1K2tYfQuef3OhwoyHE5dx4aQo+hrfZj1Y4RNdJpWfG5jQHv6XfTL8CVahY7/RO1uRT9PdDQWtNLbM1QhAPXc1VzssO70iR3ePSmmuDosZ/jD+T3IZms1z2cjGeIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587117; c=relaxed/simple;
	bh=D2pCaySHFq2pdMF2MaFrTGbBn8HmE7zZtjbdOo8bZ84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RovUCR/3c7gFNASgNyd8vrSYUgcxpf9T2LNqajmSHXWo+g1ETu3LFOGoK48VuhZZAXvOdq3cOYkpqsLwc2tfWzAvpM33qRw39i5beQ9/JC5fGxrSOTFYAzyrruS8WGYU9+xKt0UgCXaRUNidpsV4gjtAU/h46qupzMPLX/VzogQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=UkkdV/Vg; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="UkkdV/Vg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587083;
	bh=qr7vnn7eeOCjc+CY7+06nVMi7mZA3SUUNFXvLriFWI8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=UkkdV/VgT9YKpmv2p5vCzhYaVpPNMkTX8GU0fdtGh183IOIzn9iWaPL4becCONlyR
	 s43uF9oXmg3YjsPvDlW779xjH/LG+PEAabjEnezN416RkwzZ4pju1PcysZQhGIv5FT
	 G0kyMpntx5Z3tdclegBhwT/HL+rWuCKp+/xojhh0=
X-QQ-mid: zesmtpip2t1752587071t6eb91e5d
X-QQ-Originating-IP: F1q5g6EsDf65gITeUTv/PWZUZ0Adu/pQEt6UQ7FSUXk=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 21:44:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5398797519423429951
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
Subject: [PATCH v2 2/8] cxl: mce: Fix typo "notifer"
Date: Tue, 15 Jul 2025 21:44:01 +0800
Message-ID: <65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: OFelQXFBryTbt1yse0HJODq3uBQeF6nk9/u9T0cj1UuEPj2IV7pxO7Qb
	q/wsLq0fxSCuTsyBEp4Q6rXqxL9JztTqOSnf3ziSmBqWpxHkp0sRIdkVeSainfAuz1PIS8v
	YDpjitouVpjEFQ61od+/TX1CXFWcQE5YCpBctngySLTkrf3vtFVbQ0MZFztvYOEVrudkmOe
	thmK2PFZ6iOhxXykm80XKCly5z90VGxxU17r1z05ixfECON8ZGfYKGJFQQA4T/0N10lHhCM
	iQmob38T6qhf7exQjt6r0u3MA0H4oQYuH8E669V+pIIFvjUzYcqvApCeyUnBH7n7v3ZBWk8
	+RvypDcBTrIV5tZJqaMMXwxF3LrWny01f3AKsRkWLO2qmALNurxVZix1IVD0Ba1osg8u0T9
	G2QkTn3JzrLLf910qR2s7UNwifiU6qWdCslL+N0xikhZoB0esh+2ecsWSfdMWWoF5RP6GwY
	5tRzpeICLMM1m0ZiA//g5wz5uMMDeAFTcHO9sXC6yw+YiuzhT8c500wHq6oGqzrs8Zs7w+L
	Kf2eDyf8GYoU05uk76dbSfb1uvgOaS88mZn8u19dBaIdxJX335En8TgG6y/bOc3Rpg0QMN+
	Yt8JMrKDCX8aDUJoTJq6qfWD0fc4pM2OQlcEzvQgPbWJzPASyWAc1V565qXw73FIK0UtC9e
	Pw/x7dIXCwyu+dX8i8JhKn/1l4e2t05GZc8grLBJxp3FzVIzcIs0xMYMhu4PxyMf4hL/tyd
	c92FKGHe+M81w6z0P99Sy7Q0U1Q1H7DtxQZ43Z+rxbtEPAmF1fN70+bUlXq0YCUMTKBkvai
	R4GLqsoJ9xz8o7ZawIhu6INevo3ZQaBlAP2EhLc9OhtBSB0UAFKWgZC/jlN9fWLremIXv+s
	e6EuWoI3KT13sa/MvRjeHI6AU4At4y/JSVQCniypmGMtyC8B8549DRqBTb8pFp1V6cQV87P
	SuY4AYTvFBPU8PAnugrGVvhWFz5FZaWRJeV+bIweRXxMNvRSMHAcHyFxxDvhJHDuL//jizy
	z7mpDEfIRfyHkZ3zQMM9oaZ2f1BbEtMiXF1HKo2cwKtqDW4q47GPZdUbQ9MSrT4iog147jr
	rC+6XZOlBuKMYR9mT8duYgbuWotvp6azS9o8v7/12phqKzakjeWy98=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

According to the context, "mce_notifer" should be "mce_notifier".

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Fixes: 516e5bd0b6bf ("cxl: Add mce notifier to emit aliased address for extended linear cache")
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/cxl/core/mce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/mce.h b/drivers/cxl/core/mce.h
index ace73424eeb6..ca272e8db6c7 100644
--- a/drivers/cxl/core/mce.h
+++ b/drivers/cxl/core/mce.h
@@ -7,7 +7,7 @@
 
 #ifdef CONFIG_CXL_MCE
 int devm_cxl_register_mce_notifier(struct device *dev,
-				   struct notifier_block *mce_notifer);
+				   struct notifier_block *mce_notifier);
 #else
 static inline int
 devm_cxl_register_mce_notifier(struct device *dev,
-- 
2.50.0

