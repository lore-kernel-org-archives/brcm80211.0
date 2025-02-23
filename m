Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D28143C5D
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329095; cv=none; b=D1AZjCK0/9c0uA7W15sgOgeW98/tLYmKch6jXfhZ0RYkapXneENv/ccoSCd3az/EB9islKhW552AAxFfr7dMl+rmOfnIX187fzcfTULHJgHEEEANlnvYoRhd8cIBaGWhLop8k5kTgfolPHF0yQR4I9q1xnzU8FJycw//lazgQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329095; c=relaxed/simple;
	bh=v3VP9b1b7CvlBsixzdFcwOQjjl2Hrulp8xfqmv1a5yY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BOuu86/zdBVQBB8Ke2boeB2Udj/eXnSYd1d8OX7bKzZKm6RWkMCKpV6hT9fLpd+v4MqUc94OPUAzqBDyOu3hbWYCyj0Z1zBsoxS1ygQnjlmvEtNylhlbwLSzcREXlpcF+UyhTExwkWuVUDHrVCoih1llVAbqBD6hxsQcCk0Z9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQbUDUgg; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQbUDUgg"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso5850801a91.1
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329093; x=1740933893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/rM0c8KAofiqOH9E+BbTStqrJdKUl6Z4Ta9tU7voiA=;
        b=cQbUDUggXUQ+PD9tVFp/qhCGr1w6H6EG5fR8sJAFQVzc6VPI5Mcham4bO2/qUE9bcK
         fAc/MgmxCiPx6LaPsFYWicNp7xW2Wb/7geuIKVPyqNpAbmcIJBrASH8OVnshhTzoSB+i
         ZWTIqG0pmb+9k93JXmpndT/XGCU1AIVso8ldwj29xGcJbZWPtI2H/buZfdp4UInO6ceA
         bASoQ3N1eDtErynqqtFI1OKpdGd5siDPom8J6lShe2C0fIz7i2v2aDY1MyU3eiMa0HC1
         zb+flOzKsNCBayhIoKVAYMOBaFbGLVBluR4b2/Yv4tE4+/ciBueuqq8jXgwglUUdUcIf
         e7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329093; x=1740933893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/rM0c8KAofiqOH9E+BbTStqrJdKUl6Z4Ta9tU7voiA=;
        b=PjmQ6A3lX0L2r5NaiSFfm6R/NLB0NmrxMUGxEPVwD9kJdMN/TGSTzrdAgJdYimQBMy
         O8/s64WMX48P0KeMG4b2sdiKmSYzoDaL+pA2i5XcDlH+NLj3MW/DJGjbONqONCmvV6Vb
         Y9M+kMEwg7fPAiT01juU9WpFB11366khMTeEfEoZuDG/zYkCKbunD2VkfryxSnmMdwMn
         U/FHn9hZWUpBTkdxf0euVhbKx+MyFAnY5y8+x4U5FFjKcIj5Jeywt7CgiyZTajuq7w7r
         xoWquiLGUKmnwSP8cS2/c35yIfaAVDXnSo3PmWEhZfbCRsgr5ewn2kqAKYMCUke98CDN
         Y0TA==
X-Forwarded-Encrypted: i=1; AJvYcCVTUMYpaNYzQ9rQc9nFByNEPN+bXKXiVCok5iQNbJJQXnAzm9+XZTsWM61m6LGDzRLDgRficmY69Ig=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrOdkjYzmzRo724h6g+jz5hw2OHtb8sp5z357IVdIPKDPolxzS
	ajWy7zM17AHwOJGC9e5ncyJDHSmha3P9bFiaqgwVqn9hZM4tiBCd
X-Gm-Gg: ASbGncvqm1Ac/Hq3IgeDeGbpRFejpvZBvf8C8UmRpF0C+7bSyuYd3xAAbSR8NWZbuxN
	iFmi6CLyZnQwlJy1oTmCa+sNwPXGoymXqTfu167h7RpIrMwp3XmsB6vMf+EFeH4V6PkWUnmKEYq
	m99Uof54zKZfMHUqq8kcM8Senoi1eh/nfhWXmaSYAwpqTQEIR+EYc3t4rPgrda9clqe0vj03jY9
	5MxjmMO4154CgY4CtL7kbCxcsFbx3GvyNJG4LMqV+lvM4UcFvvHVYNbqYnGmGvZiVCAiID7Ovhq
	odt9B+hLqH6zSXz8dtFH1MhKp1Gjc4vq3VPT06wicTpcMPUrie0Wis1l
X-Google-Smtp-Source: AGHT+IFyGSvrJM271swgjLlCi2TwHZU6y12ME2N9/TuoQb9IugR13IQRKyCWyxRNE+S6ruhpAiUUqQ==
X-Received: by 2002:a17:90b:2b8f:b0:2ea:3f34:f194 with SMTP id 98e67ed59e1d1-2fce78aab09mr18428370a91.10.1740329093592;
        Sun, 23 Feb 2025 08:44:53 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:44:53 -0800 (PST)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 11/17] wifi: brcm80211: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:11 +0800
Message-Id: <20250223164217.2139331-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

