Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB91E22FA
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839252; cv=none; b=VmyYuXaSEGJYuvU/vq39cd6Z+GMwwODLa9R6VghF65p9ZeLFM3mbhePn56PTSr+MoqJGQV4BTvhqpkqRcS/qVy6U9iC3i3k6bHNKH7FQwdWTyryA4NYhkvmepIv5ZElPYMVCREZfEfAgGxKuQrttCUMwmvDtdIg08eeb3yGImfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839252; c=relaxed/simple;
	bh=ZR7k7WuXjWgoiKosaPdwElgny5Md8dRLy7kh+y/t7/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ku1qHYly6MfxCr5ewWZUZ1R/lw/v+cvXcKMPnf8bmbfmR7JyirkStSGvyLabEQAt3E8KZg1r+UzeNpcrQi5mCzzD9nP+SvUuKLn/s2H1ABNrD0bfzEhum9FjyfiMbZcRna8+XCjrdEscu1ue4xop8yfOVDrf3aHFK9umNcaRxkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0jbVLUN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0jbVLUN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223378e2b0dso44915565ad.0
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839250; x=1741444050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=G0jbVLUNhxAECabjwojtXgFpzY8/Jr1H3qRPbwmTyE3e1kJm7JTvdgB4DkKIuf8h/c
         Y1N7gZ6WslghKcPYCG7uvKKQRsS6unWIL1xPeaqn6GFLO1avGLIlBUNTPa29j+TMX+Wm
         774U0foaygXRomX9xQ1jsFcXWPjmkEUuzChuu166B+XSWuBj/78bPg0d5fGCl0jlyQ2q
         u1hm/iUJgd1D8hBWyJbzetOeT1cgFQU6STk91lm5rmyVWb6iHAWXYPBTcly4Eyj0+X7y
         jp45raXeRcql/KIM6dqp3gejYTcFYN0DtO4XVInFxanuqg24a4YPYNAZWg71eYm68yRe
         6/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839250; x=1741444050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=NV2w/d/xax3pHzwn0UXGokFVNpV4ME3w+HRu+MkAtgMTTiYhSTw1BAqpg5YlR2XD+n
         iCFbcR3NTdjut9PE5laGNfy7/n044yEmUYZpO8Ge81uNZqtcNoSLgKlpXzcOCjlyyKeu
         D1NAIAxnliHDtA9OhgthxNdVVY9ApJAoYu501XmhvkDDCnoIT91YGWdyxKlXjDtq8rfm
         9EfwjgrgqiLeijMJk0EbZ9y+C1m+7dhmx1CAqVU9BwN5ghE62i7SqayO9fChAePuaO3x
         pdLa1wVMi1Sq19bOsugA/PZrCJySvMNVGfPNITsP5iV202+HAhcRizP0aewPdGA85hz/
         apzg==
X-Forwarded-Encrypted: i=1; AJvYcCXILcl2ZQ2mM1ad4vbmouTLMhuszLOh0fWJwtdSYyydpicST3uj5R89QhobOtLB0cbgarwFOOV3E2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHMbU1M0ZPs1orazU35sAuExG58ocMHo3+Nmngf+AWg8w7LiFu
	nVgia8u9Cq3we+vC+NGh77xm54vqiYb1oKrgffLOLQEm821gzdTU
X-Gm-Gg: ASbGncvdzNwlB8fi82a05bbwtmg1eOal33B9c9rGyxrnmGppQPyBtpSWFJTISEJDdqY
	VogWmUwQwSMkoazI3T2KutdZgPfD+ubb54QMSNbxBtFAaij9cmmBKFOq26ErrlckBsa75L8IGqx
	dUjCxw1aZURZwENvL6U12Qn58CR47r82wxY6CcSq4W+M44KWpwVNVWtY34kXtzNpk4VuGOWtkra
	8V6RAgxVmhVjl1AbajhwnbHoKol+160sig2VcrkMieqZMwSZqtTdP5UFIjjUcxEjHX8iWhRY99t
	tvrbC4xcTNbdEiFa3ssfLYm8pim4yybae7q/lfvxs14sRvDJ3KoCA1rmvZEB6UVsaR9jVzinelg
	=
X-Google-Smtp-Source: AGHT+IFMEc8dvlQQuKrdEq7g4EcMsmoDBk21A7+d2Y0BFwhyjxtIIjawJKqlgdflPWZNOKVAtnpI1w==
X-Received: by 2002:a17:903:2ca:b0:21f:55e:ed71 with SMTP id d9443c01a7336-22368f6d002mr138003395ad.5.1740839249904;
        Sat, 01 Mar 2025 06:27:29 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:29 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 13/18] mtd: ssfdc: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:04 +0800
Message-Id: <20250301142409.2513835-14-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/mtd/ssfdc.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..e7f9e73da644 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,20 +179,6 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
@@ -215,7 +202,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity32(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1

