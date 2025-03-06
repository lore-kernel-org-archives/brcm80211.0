Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A67231CB0
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278410; cv=none; b=qBE1d9QxaA97yX7X9X61IaVfKqWiGpxW9FpeQE1tGRIVZbHFl9mQhILChptdGEdq9iJ51IlMrAV7TNx7cVM9w8KRxMDC2rJn4HnPtRT8uFPyfv79HfBrfc4BLXuSsWV6HltuldVvDWwg1fSvwCgOqpdbvqPG65aSdwhY3LELVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278410; c=relaxed/simple;
	bh=j2/wDG0L2QiKPBmNCWrxOGnHtFWO5kAL6+5E33WSh7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iIZv1mniXCIxdZ17vMD917w0uDLobAmzBvCEkvxnKtXCNpLDhS2iakHWdNg8hkuFYUxfHpW2I67hr5a3MhDtaMzLVsH1U/KK9vcWpyvyKPfe3osUlhVvx1cEDS16QqnX13WpFNfmyhL+AGzy2o2n1Xl2sSL+cO1FAQ/jhWeCen4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSZNwnhK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSZNwnhK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso452589a91.1
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278408; x=1741883208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=OSZNwnhKEkEKiDLF9UgmqumZltWIH5rnPih45NWYf/YzutSpXXUItZRKKiG9vxcPZo
         hUbDC0lAAP3FQnniXOE+w7kge7GbqFO+VVONDms0ZcdcRc1y7aiteC6p2c3i93ed0Xk+
         KMb3Ych0rP2hShMm30BvKbpQVSstt3sdEiist9WKX/BBSFL6nVWRY61AhG4NkeCAU4i0
         H5kqchx9CuP1XYOV7uiII4lROoEc+A7PAAA9zc1qfPGQlaU9QkaBtzT+Zo7H0TC+X299
         +yBbAk0rdHi4bWUfwJ9nJcKwFFM1fpAB0uSLMi4yZa8CFtNqbWuEld3t49S6yEL+4zuW
         +VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278409; x=1741883209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=HQr3Ak6O384cNSpJF1Y00ROQs/7d3BnpOOWLsPQ5TbqdkySeJt/dMKMYHnCIFHWFpb
         L9je6tbDdKV+Om0DO80ARE9+k5cva3M+rDPJSd8j/NCyhsIA9nKxApbiYHfXG5/d+wUx
         lGwV2xy+jiyT9SUmeXGHKgVG/SO5KrUV1JNIddAXqOlIA5pI7XJdtS/f8KJPixjzG8DG
         mUBZrtecQC0iHQBzubOwpy+4guugQcjsFvoTjhPCJRkU6pIm9rBVj5e+A09D61pyhbe9
         L91HMqOJW+yHkS6DuCSmfJls3qWpw3WaCIYByazdbIfbhbNSavOsAqn8K+fWYsvJt7qE
         Goqg==
X-Forwarded-Encrypted: i=1; AJvYcCVW0z+Q3gLok6Nao8KrMrj1YWNL++6wmlVKV2ezdBD5vl7Ji3C2VI9s8bDlhofk18ORncinrWUvjn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxN4LxZa+otwWcd/pVc0aKK/HnWmJNDjiLgQ15dv97bgJqQhsOB
	WIzCmS5mVvHv3yOSviSoFaorz+fBWgZdWpJdllQOw4KWPNZKT7sF
X-Gm-Gg: ASbGncuGOSeHOYzMCBzK5RyPGn4bDFr86hxS6UdSqjsMJ7gYbJs+dvu0/v8EtzE30Ge
	ARz8qlKOi4PoZsy1N3iRQEbCn0ulKWKhAxirVLqf4sf8GWronHH3Rb94U49jgUnjN/x6UYhHA/k
	nA3riGXpx5sHv3s1bG3XXVnEqdZjr8yzpXbuIeibYglTzg7HT/ClAKhRxbxtUMvz9Ct7XE6bgrJ
	9iC1T/nGeX//HM4/lG2VqkUl2E+JIXY1/Sr5d5a3HWBfaB37O3fFg7yW1qz4KuLmFRwj7wg5yjr
	P8geJekrbWEFgCboSmmMBuGKI5a534WY6lXW1usxHcTDODfAjrmk/hNlvJrwwuf2uBscxSHre2Y
	=
X-Google-Smtp-Source: AGHT+IE6epbCXvOg8cIc3QqWkrmaal2XvyOtsnANvbKq/mA/VIWvo3NmMHOwXwWdALV1bmHV/eFsdg==
X-Received: by 2002:a17:90b:4b44:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-2ff7b28a652mr262212a91.34.1741278408658;
        Thu, 06 Mar 2025 08:26:48 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:48 -0800 (PST)
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
Subject: [PATCH v3 05/16] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:30 +0800
Message-Id: <20250306162541.2633025-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
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

