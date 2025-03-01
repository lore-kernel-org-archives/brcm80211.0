Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E01E0DE3
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839231; cv=none; b=i58e3H86nIjN2WktruKBVWnbiCpK+PUSpDkZOLCsu9LfP/ZLdyfy+IA5ujzLcddLTEwV2zJP90k+Dqa8Df+ofCswpLHzM06jUCom8lvky1fc8B4HFEpcT39Vb6TE+JFKC0+yx6FJz848mc0i1HpffB2f1j/p1hV5rPNqQd9ogyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839231; c=relaxed/simple;
	bh=LKQP83Z0dDVRvLCdrMNAz3pPTpKO+Di7Zsh2SQ1o/Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1lVMlL3OOa/z2n+cn2Z8rbFHELp/mzZr38gipMrHJoac/10x2+unEbL8jJ/wppxNX7GV4l36nR3bR08ye8Z74IDcO3YKEuR2JCe9dtY1JXC7FbSy2vAk4Bl0vJwRamnMBzXuOT6slC3uVV731fwDmJC3aEBul0E8HcB/v/fSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZsa7QEu; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZsa7QEu"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223480ea43aso77702265ad.1
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839229; x=1741444029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=BZsa7QEuvYkzS6DG5VYiEbW6fTuRbYsb4a1bmKWu/yDreXkLg6o0RUfwl8g+iCW6zn
         XTJmLqk2wmxTAiHkCmJ4yITTyox+f5ZN1LWfMHmXh3xLjlVcbtVPKFQzPVpg/L6ce9I9
         RZPnLOJTnWdb2v5HiQohjZ5SjPe36MqTDJzoNspGKVoW+hiZEn1ZIkaHP/ovEOnE1kRK
         nnFkjCYUHan139hJUq5XgTYho3omGREp1+dbG9Tq/4uUieevNTdMdTdvJwHHvt87JzCl
         hx/FgIR+LgFiQCgGea9CmZ7WKSyocu7MWoOtdEbNUtPJ1zAr5hl+um2wYTfE+91ME3tc
         lQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839229; x=1741444029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih00TRqmhmd1Mh0sl7zFiAmpBAeBPMq/8Nno4TrvKu8=;
        b=usSYO8Q2rIQiLZHQo15OalLu1Q0VgCfhR+2kNg7V4GP6K1WUNCe6MIDf/9kcuoFvoC
         9XVRZ1/Ai3O+Yf0RF1twBT8WUsErf+xG7ZtSzapYNjDb9BhLNI4QlllBu6J16qDBD0Vi
         DFV3YUa3ShWT4kfkkhcbexWJm2XNsAK9HlQFtZx+PUr9xV+uau2h/JNbGu7G0glJmKXh
         j05sYJWXe4kGEm/YpTohi3YoLVBWYBvAyhUm12abXdhCThEIfiE11bjpAnoIOQ31p5XU
         j32JaHTsXhl1tRnPJnwJVrcdWVeEFPwdtxDeG4UHUxUIRLMebl0RJb1prCYY9YqgEekz
         0x7w==
X-Forwarded-Encrypted: i=1; AJvYcCVjDDw3AhYdIgi+zsuqr2A2HH/uH2qEy9avmNvfdAdSuQzlJNZdAW/pxDsAxjiBZg6ssiJUxGKbvzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0hzEGRu3iP0GLIQc8u9iFuk6nJLwZltoLcT+gsbsJgTFXQetJ
	WeqMVgHBgCLBkwZdaAdjQrNS7trsOPRLH+8BJaDPHs/3TwMiUyC4
X-Gm-Gg: ASbGnctuhb3Uw9tfaAJ3sWp1XDFtdLTmqqvJWefZuB0LvO0Ar0YHFm76jYOTRFk//sy
	86LgA9E0pZkwP7KBwuk9+4ybjhUS/4bS9JGyh4Jrsh1t1vMfIYKLPB+BpgTIMoIL97vsdXqLde+
	bR6atfkNjCWS7BZsTEB0U9VVB7IurDIauJPIevbdhNepBQTjPR7WMG9Pw3wbJJHx4lCPsnlXDdw
	cPyorxpyiX5CIP8CocDfwWzo2HDFk+mM8+6IrtSIncQNFp62bnYtNH7iUmTl4Vzuc/lEHoIBc1G
	ausQCaGThoQL8QSznXgXdISbzk0RFJHOB7hQUX4d0+N+SvzMeHbOu3/fl/byF8nenp8/thTl1oA
	=
X-Google-Smtp-Source: AGHT+IEWIU2a96xKy97Vw2OZbiqRo6ZsV5By1mOyMKGEerXJ25OnWhIdagB26u20PcByLRXKVw2xEw==
X-Received: by 2002:a17:903:32c8:b0:223:2744:cb32 with SMTP id d9443c01a7336-22368f732b3mr142906935ad.5.1740839229452;
        Sat, 01 Mar 2025 06:27:09 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:08 -0800 (PST)
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
Subject: [PATCH v2 11/18] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:02 +0800
Message-Id: <20250301142409.2513835-12-visitorckw@gmail.com>
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..d1a1ecd97d42 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,21 +284,6 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
 	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
-- 
2.34.1

