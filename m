Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD313B298
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329040; cv=none; b=BKoyHVik97pd35SxtJjOYHNYkssEsTjiiQKua9vwbimK+44AS+b1oLfUO3O0h3U1w1IWRv4T5itDgw3u8trEvJGo11obeGa8Ybx8SGILDayeCqYsd8a9qv96xN6106Fprf33xpxlUL9bFPoU9X/ClsgKJURpBut96/egNhOid7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329040; c=relaxed/simple;
	bh=j2/wDG0L2QiKPBmNCWrxOGnHtFWO5kAL6+5E33WSh7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VGYqt//T1uSgv3k/DQsBIeZV8fbWnTiJnKL+id0TnZ3w6YjYoiPbexvrkvTerOtpywXRBWanj50lTxt8AB/qO0uHBx7T+OjgcaZ8Pxpocs887Fdc864OzQm60bi+eHqZuL7AqmrZRPhoyRjuXDW0ZFuFeBM1aDAHVTCjRgM5b8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXAhPoIb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXAhPoIb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22101839807so77145165ad.3
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329037; x=1740933837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=dXAhPoIbUdpWRky4Tbi/2eBXKrCq0Qxc1EDR75jXRBkPUW8prTjLdcNnFBW3cJhLqz
         VUGn1ZlM8oLwMn0ORY/TWBWiV7j9Kl69E5VKFgkdmFpPocRNBcX8iNiLJNXqoUq+cFBa
         6JkZyPzfv+EHdrt0NSu0Fm43D7Niqc9kNluAyhsqy7c6tEbBPWiwaDnJRnwULkrhN87o
         OD47XLmicMg1QMEf0/pwpQq8/D7sTHzgQ/6pzO6lS15EMsDSiBXZgbNsscf9jJuQqA9h
         jMfqfUO2kBO+H8Erc7lkHyAqumojPW+rlAVqnFGvW6bSdDcN43czfdPus8F6+sEWCK6U
         azkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329037; x=1740933837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=PxlP0IHdkMVPrBmo/ULiyWymHU9UiQZi08eJglsToP60tbOYvSNfYLw3lIIZeaiDli
         rkYuLUNuo/5xTJGOl5U+RgNSD+J8PYwWzytraI7UA0GJ6RhHTMasfvp3vDUucmdyRczZ
         pBjpYGQI54Wex6ncFdSJvXo8Lk3LPLFrmkR7eLGzqngOuVIbxZQMoF8ffEIoew5vh5cr
         fn1qpR0KVDJNQnh+wXKxitGpXZWw3YJgeb3mgoLlSEzCkhoi0PcAbU5JfgeNwJBS/SK5
         KRKLTI6dSS/oq7cHLw+djsKmkUQfxw3LC/zxWXIFxzR1x8MTGeGMRkusTBmno9NDbGJo
         t43g==
X-Forwarded-Encrypted: i=1; AJvYcCXfku55d7ZuRIsB1pS30CbXFGJSmltXZLqlEAqj0dNn6DLl2s1GE5j/QRoDojtCBaPtzlC4pv6p4tc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQZj2HNPyRQwcIg0xDL/3Mcwr3D5iiPGUgZFL0wE8jTso5/dLT
	AbGozn+OLSFCdCHXaKr7BowRaQfNlhP/6N1xRYSpa8UDQoNWYuyc
X-Gm-Gg: ASbGncsSCdHzxo5Fo1WesKMBA1s8mc//VqToejA5qXjSmShmlQRT+dMRJVahAr0hghS
	elXy5LpGnWIuiWpxlpE6vvhZVwKFN+aglvrskBiUDUnh8T68M7DLCtw9t94bkbW0u8kpnWHs2G9
	hKSDU3SwAztJo3KK25Dm55BnrcwcHJAD4147GuKaP5az+Wkthe8uveTcokYDqppCNPSH+jIFG1l
	ooK4Xg4BvTcBFs3W5rIrAQQaTgb49Gr9U2xBwW/nYRhGq+lpygnE7imjnFNhtsohuNYyM0q+weq
	lU6tFhm3yRM5L50g/6W6/gGODwG/mcnU500oJu47Y72ukBwAGdl4ENLn
X-Google-Smtp-Source: AGHT+IEgNthmnTYYE27hPhlCIM7V4DPg7XXe7YBwN1u1Fl+WN3rwEYwr5OtCEkA4s1cdBmE2mWkiww==
X-Received: by 2002:a17:902:db07:b0:216:73f0:ef63 with SMTP id d9443c01a7336-2219fff4377mr185099965ad.49.1740329036761;
        Sun, 23 Feb 2025 08:43:56 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:56 -0800 (PST)
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
Subject: [PATCH 06/17] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:06 +0800
Message-Id: <20250223164217.2139331-7-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..b8b8f206ec3a 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -25,6 +25,7 @@
 
 #include "saa711x_regs.h"
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -664,15 +665,6 @@ static const unsigned char saa7115_init_misc[] = {
 	0x00, 0x00
 };
 
-static int saa711x_odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int saa711x_decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -1227,7 +1219,7 @@ static int saa711x_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vb
 		vbi->type = V4L2_SLICED_TELETEXT_B;
 		break;
 	case 4:
-		if (!saa711x_odd_parity(p[0]) || !saa711x_odd_parity(p[1]))
+		if (!parity8(p[0]) || !parity8(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1

