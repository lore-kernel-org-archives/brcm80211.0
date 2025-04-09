Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120B267F7A
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213485; cv=none; b=YP/PGZ3NGIMurhJKHyyjVKojSnYVbLnpukLjmPKBOdaQjQmejNIrGHnaExqax9P0P9x2VhNV2ZUugZ9FIbwh06+iGxyYpd3+0cJbCjXOEgdgGatVxZGs/J713Q9PLagUi3DWoOPEA+14eEK125h1X9+Gl5/0Wqh8tiimAHW9o5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213485; c=relaxed/simple;
	bh=oHQrnfjD6zGDvLMJt8UwAGBX2UA7OK99C+0viCcwLZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKy5+qh3tRtsxQZTWncIoTY1cWbIw5o+fNslwYfIuyQhhKTbn2Mxrrw/cWAhaSBS9uSVMmiL7JgT6FQs8xcyDL/O3lVEoFkvIrWC9udpsIrjjfcYy52+61GP2VYTYA5DxwZSXhZbDJx5STSIzMDSnUr0kpoodoln4nFJ+r4QAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/rLiyvD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/rLiyvD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so5599624a91.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213482; x=1744818282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW4oOCfCNW1Ikfi6N7oqyzQRlobsbPmX3F7QqOKxP+I=;
        b=W/rLiyvDdAzNA3K6kPRnJaUH3GLdsyp4MvFtQzBt2Om1Y38hxL3PWPE1PjoJ3qfbiY
         rGSdYAVj+7FH/fwfvBMsYEavRFJnprIzpewuCPtcOQ/DahNajaLZ1yGhdIpNZooxv/49
         6B+DtLnlKSC3K/vuasvImnQj6S4jNfXCsUcst13i57/XGRPXCCyg38eKRzSF+Fu8vF5F
         sjWIMhocMVAaf0N2cz9vBoHZ1foXDyJZy3wecFT54EpSRCoJkpckcAWPPvXVRuB4mX/q
         GBlqC/JKEfL00VY2esaAptprWuKgM77smAm3BG1hvx699wqE1ebRgVkWfg2TWO2RbUCF
         wixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213482; x=1744818282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW4oOCfCNW1Ikfi6N7oqyzQRlobsbPmX3F7QqOKxP+I=;
        b=lJhaRq0uLiL1fA2YFVm2WblNT4EDZHSJfGQhKPCGE0pH/4fxcsDH9iy5NMVCx3SBv4
         YQF260QZBdJnGvBVWuVNjwzO7omA8RIJ18rxISyZ6mkd7qCq5YoGNYsq5U33dMp+G8fA
         Wq423HKN9Tso+F06ioNcYkvzYTnqCcpwkWqMKXqCBcRaaoYD8IIAfUNXi7wbBVfv1vGW
         iPVeLMMB2N5SFs16ePSZsw1D+qgal1rLqIHaYIv11odGY6dvLCG2IF6yJnMx4Gixbc2j
         CjkDO+JMc/h4jEnzNeXdmdE9ij8Zr7L8fCa3bfaU3FeEiTofHOoWoLkgnJ6F/d5S2qxK
         C2zg==
X-Forwarded-Encrypted: i=1; AJvYcCUToeyownBBdzaaccKCTRV8IBkR5dgIh6VGJCkfCsCkPhWVfbsaEva+c+gFubdbti5HQzq1lmFF2SI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4I+OJAYhXySA7ZiFDC8zqsXlqRjXJ338evm/xk0EpAhD4zx2T
	rXQlu3ZcXPtBLbDnRmzzeTJ1b03D0AjZ7+PMfHxYBVtcq5kYCMFj
X-Gm-Gg: ASbGncsdEQQ9bCwqFWBryVFm45eWWJ3Fl1FHpLLpeFzpn/K89xTHr16d0VGDcKzuiuz
	i8hKYdseXNCidUdwiISPdGenPrVauiWvgAGweopeiq/IVgvUnBtmFYU8qiLhmkIfQ9iTL2SW2PL
	YfJkVt1P7q2FAAxTjUck8jqzAAHAZBCnyQevbRvk8ReVpbd4OfLOG0d5AkuTnL7WthgnZc7eZrM
	DxFqAbduTS75prqHXZExRpBmMein8Y+2wizpyvcVhfVQE1SdOWaIyj542FMXS8wOJE/cBkeCk3L
	O+7M9WK7NaAUYW/Ccd9yO41npAxdbOniafKQFuPKMNG8vki5EDISTDa3jOUZi1LzVNaeDLo=
X-Google-Smtp-Source: AGHT+IGgg0DBuH33oW+E+873bMYyZA/oUaltEXJsqFjgXBWTSXKYJ4mXYIMoJApL4m1vTMrn1nnOpQ==
X-Received: by 2002:a17:90a:f946:b0:2ff:4bac:6fa2 with SMTP id 98e67ed59e1d1-306dbbc1e1emr5446016a91.16.1744213481930;
        Wed, 09 Apr 2025 08:44:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:44:41 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with u64 input and bool return type
Date: Wed,  9 Apr 2025 23:43:44 +0800
Message-Id: <20250409154356.423512-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redesign the parity8() helper as parity_odd(), changing its input type
from u8 to u64 to support broader use cases and its return type from
int to bool to clearly reflect the function's binary output. The
function now returns true for odd parity and false for even parity,
making its behavior more intuitive based on the name.

Also mark the function with __attribute_const__ to enable better
compiler optimization, as the result depends solely on its input and
has no side effects.

While more efficient implementations may exist, further optimization is
postponed until a use case in performance-critical paths arises.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/x86/kernel/bootflag.c               |  4 ++--
 drivers/hwmon/spd5118.c                  |  2 +-
 drivers/i3c/master/dw-i3c-master.c       |  2 +-
 drivers/i3c/master/i3c-master-cdns.c     |  2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
 include/linux/bitops.h                   | 19 ++++++++++++-------
 6 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 73274d76ce16..86aae4b2bfd5 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
 	unsigned long flags;
 
 	if (sbf_port != -1) {
-		if (!parity8(v))
+		if (!parity_odd(v))
 			v ^= SBF_PARITY;
 
 		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
@@ -57,7 +57,7 @@ static bool __init sbf_value_valid(u8 v)
 {
 	if (v & SBF_RESERVED)		/* Reserved bits */
 		return false;
-	if (!parity8(v))
+	if (!parity_odd(v))
 		return false;
 
 	return true;
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 358152868d96..15761f2ca4e9 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -298,7 +298,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
  */
 static bool spd5118_vendor_valid(u8 bank, u8 id)
 {
-	if (parity8(bank) == 0 || parity8(id) == 0)
+	if (!parity_odd(bank) || !parity_odd(id))
 		return false;
 
 	id &= 0x7f;
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..dc61d87fcd94 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -867,7 +867,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		master->devs[pos].addr = ret;
 		last_addr = ret;
 
-		ret |= parity8(ret) ? 0 : BIT(7);
+		ret |= parity_odd(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654..df14f978a388 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,7 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
+	ret |= parity_odd(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 85c4916972e4..d692a299607d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -114,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
 	dat_w0 = dat_w0_read(dat_idx);
 	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
 	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
-		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
+		  (parity_odd(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..7c4c8afccef1 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -230,35 +230,40 @@ static inline int get_count_order_long(unsigned long l)
 }
 
 /**
- * parity8 - get the parity of an u8 value
- * @value: the value to be examined
+ * parity_odd - get the parity of an u64 value
+ * @val: the value to be examined
  *
- * Determine the parity of the u8 argument.
+ * Determine the parity of the u64 argument.
  *
  * Returns:
- * 0 for even parity, 1 for odd parity
+ * false for even parity, true for odd parity
  *
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity_odd(val))
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (!parity_odd(val))
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+#ifndef parity_odd
+static inline __attribute_const__ bool parity_odd(u64 val)
 {
 	/*
 	 * One explanation of this algorithm:
 	 * https://funloop.org/codex/problem/parity/README.html
 	 */
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
 	val ^= val >> 4;
 	return (0x6996 >> (val & 0xf)) & 1;
 }
+#endif
 
 /**
  * __ffs64 - find first set bit in a 64 bit word
-- 
2.34.1

