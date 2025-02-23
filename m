Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA291474A0
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329117; cv=none; b=PjNKAuOu3Y7qlF72Xue3OOjPiQFrHflVMvFe8q/yYSZ8tvpVaQSwLvdkXn8+xa/Hwj2rQvjmnBUNtQ5ZHU5b8oAirXL6BswdpL0jr1MKnsMCBp1mF1x9YWTEqtAHMW7frm3jswZAf552DqZc75xI/0u9wXEYYqAlra3axGoVWjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329117; c=relaxed/simple;
	bh=ZR7k7WuXjWgoiKosaPdwElgny5Md8dRLy7kh+y/t7/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pAcMZuvattZMnP1WsrCOrYkpAjrl+0b+vksnsPSvPlk4uVpbZFpVizsaMe/0kg93/Avnjfe8OLSDqivjdxH0KHSv9+c/J8hM1YaTShZGBGx5bzHyIKdRPFeaFs5RlS1n9AqnJHk5y9ncvWivB+77UWhgQXo+64IT9tTP3Bz4IN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMmAhwf8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMmAhwf8"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so5518704a91.2
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329115; x=1740933915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=KMmAhwf8idodbHGA8+/z6KpoUUM4k1htD9WQ7BOACjrIfYOZP3Wg18BfL0d4yE/Xbg
         wGpQqFVB6684Zf6dttM5quNvuELPy8Ctvp6muyZtTNieOW/dJXI6c7jUe0hvSg49Auyf
         9wjwcyk+lmlj+G4lnjFD7bNJ9ekCf0SKRCDm7YCoo6EGZxmZxxWIY976Zsnn5xW5m8Lq
         0cZ6dzHrVkaRDLeISO5sxCiGvaHQske7RD65SW2ZDTstrKWyLyXR7yh15SUlZmD4SCZX
         j5KPnYAbUyjz8NSEUEBLrO5qqH9FJ4fQMHBHGHG5LMkGR/BJHvCM0EgAbKbwNmwKTj9o
         T96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329115; x=1740933915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0fPaIWjdscIdDk4T1YIhhdJwaKRFyAzbGum2CZXkTo=;
        b=by9s+lTrpAutZ8T1h2iaV2gd7/XYK/3LAjBhdR+gUwGITEvs440Gaa/G3x4A78zIVW
         qy7NE8AqjN76y2rZNKWGBWe0jqd0VBcCJehEQse2MJujW+/wnfmaUehKNwV9Bokn1EUn
         2bZ5iVme8DWPDtHNSznjkA2vlMgUxuul8p7u0MSQjk0QtBcKHdSvoljajq/J0jqph98+
         eRCClP9bWk4ZN9ZaPkthCfRtbxsuWfDC47KlTzi1TGWWHPu3C6Necg8zgcdolwOOGtPK
         zxE6lz+61WqRmfe+xBZn3F5Arkyo1kzaN92AdTktG236SN09LBUM+12yCzBbY1J0ldbg
         EVEw==
X-Forwarded-Encrypted: i=1; AJvYcCWmgotvo41rB5YNJZqAmcumFVWjex94fTkBMaIyLMvaAucsAOEQpsZETCi8Pl52+EyQl8IPgx+8i2I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz41dF1ozshV19xYEFH0nycrFPsIY+psInyX1R3NL0y1uqnA1Ip
	8UovBUyhIZC9h67qDPdboBJEoX8enF92Nngs0mj5XOaPi9dxceo0
X-Gm-Gg: ASbGncsqrV3ekL66yjLehKCuW8XId9kZK0GKV2YzuIPXJ5N4W9vH/O6VQhsAHUp0cN/
	WcKufem4hKQherP9IsEIRm93+RyUHlztUf29PBm6LiSszvodUs+X1weOs/OhMx8QrXHSLPun72f
	CXbIvDkAvQJG+boYjE57I7jWYZ61FHvSTyDbKw45uK6bVJTRjNpQbr/PJRG6HulGq5bWhlqCGdN
	1BvzK4NKKjsbeEWaPySc4yCsLBoBJEjvzVF33WIZt6Jk6AKFJcaUSGjsmt/QaX9n5l1OGsnOyoV
	VhckCEQyNLIeAoPcnSvWva9AypjLttQX0lhSSwWeHa5xI3Nve0MMUx2x
X-Google-Smtp-Source: AGHT+IGRfmJ1JykXVI/nOn1hWPryN6XcmSxHhj3JPmFZZoIcxcyuC/O0UeP8Z39VhK9JcSyFdzE6jQ==
X-Received: by 2002:a17:90b:548c:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2fce77a4863mr16234632a91.5.1740329114693;
        Sun, 23 Feb 2025 08:45:14 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:14 -0800 (PST)
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
Subject: [PATCH 13/17] mtd: ssfdc: Replace open-coded parity calculation with parity32()
Date: Mon, 24 Feb 2025 00:42:13 +0800
Message-Id: <20250223164217.2139331-14-visitorckw@gmail.com>
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

