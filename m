Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8891B0F19
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213505; cv=none; b=hjUuUdBRImyqYAKnFABjG019lbfS5Bv1hvrw6b6OAuERO/TUewAqY57BTc8TOjbafBdRtHlpBZnhEQkFZDXC7Q07ng5FV2LGgcaAPtfdLMXYPoJPem1TkxC3YYjusFrR3aTOLx6hIXUzj4vvZsjVQyG/feoglJZT6RRX5tlFW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213505; c=relaxed/simple;
	bh=E5jMKv5zKLA8UMnazOfvbwFC+s6I1bdXfA7VFgo9u8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kq8a4DWCLgRFHiBy2Xxs/9moukYK8vsC0y8+jzJLR6AeTXBrWqvoQ+uvoRXYzAqEB0sFwtQESbPKAcTIKUniUHFBz0jGMV5HsmK6kcQJA7BtyyAeKmLExm518H9qEV9t9Ha153aXjR2Eh3n7QnNIp5Y/OuKuUMaJWIVPxq+sGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqhN5FpJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqhN5FpJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so5479845a91.2
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213503; x=1744818303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU43UpH11wLCdsjhsyHst5iurlQ+ThcWcqMooUtxxjY=;
        b=LqhN5FpJ4/M3teEiasyIAqSsXa6MxjU7cEITt5LuAFH8snyI4rZS+p8uoN3G1uNEp+
         z7jwH2Tlff2FoWNzxkhX3RIZMoPcKmzvLeVGPRh3Bk68SwdwdLPpupUY0bW5VOcN0Yrd
         QNr71drY04Y1aGaGzhMGaX6uHIzD5l35951ZhS5ak8NM9OTGN/1VJPtD9qsNxQItKVzS
         znaahXGewAvnVCaZKMxpor5L6YQJAk/XLs7uS0KbxFAL46qUkWkAIcdoy49jmQgthprg
         9SWDTXpztsYb3psmbCS5iLyiyEe+Y3j9RwKuKMxek8ZISWUYXICnoyERQaHDvy9Zqyny
         EaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213503; x=1744818303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU43UpH11wLCdsjhsyHst5iurlQ+ThcWcqMooUtxxjY=;
        b=n0HSu112i81u+MDg5Vn5Xds8c2VOJFNFgzNMkrCpjto6tSGWBmtrgBHrJZ96+fs0XG
         totEJPkJBnorIFxfhj9oDpRSBK7OXWKoWgqV/BXmDpZbEp1/kWBL6A17QHnMNy6XiHOk
         KcUdRVXp1WAVIcnF1qjfaPJefkxtKIuP2FCXpkOl+2I6PqJNDe64wDOSSXYY8bSfJ1P5
         XfquvxBB40xyWB7eBzTx3pU3FzF3l0Cu+QRuDjlIzF5rZQI51BEGSEkLJVOgXsOG6yVr
         pPCjgmmK05f2vqK9qcDLGzZ3Cm7HOWteeXdZ9t23aRPXQMruurUFR5Mh4gILQLFJmNJB
         PYsw==
X-Forwarded-Encrypted: i=1; AJvYcCWuXhGyEuIV6Ta5/5k2f0SlHqxCKhw5KzV0mqtKAW8yIMPGaUQqwWVN/BPUqV5Ezt3bjkqHlfrKZOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlZuEiIJDgEfyhGTfO4LscnExbkNVvGmAqoeNuJ0umm0y6zsxA
	qDaYn8BJzT983veytz8F/NS3zW4tNfVLZU8Q0GGz1HGp9PcLEbuj
X-Gm-Gg: ASbGncvB3q6ESrUVJ1IhLKieOAHAwbJslmRr/AzDZ463af0fy3/bkfk7+WjMnsfCxIh
	kIJJTCUhKvqpqDgPEhFzUajVb9fbnoxlIyOht5iGG1DMttAsHI2L0GXD/SfPF84N7VjWuXRCKN/
	eCbLUcKbjXFWnA566s1jzAmMIfi+a1YvYgYYh58C1ftVddwtwGYz6OCkh5orOHkz3iQ9u8e/A0u
	cVqjpb3ki7+52fN76JlUbzSh+XoF8f3naaWHlPcWOIiw+3E1+tHr2HfP2T9k8+9Ax4QiPCSwfIE
	/IFebimIapr1GE7l/a5NrABGIbnqSEgzEZChdjmzhjtyv59u+KbxzcJhmvZCpy+azRxZERA=
X-Google-Smtp-Source: AGHT+IEs9q8P41yMEf/AWjN7idtRUGM7Z4tfe1JBSuODcHBz5h8hVFHXITrRQEV2h0IxkqA/pyunWg==
X-Received: by 2002:a17:90b:4a47:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-306dd52d43amr4827521a91.17.1744213503051;
        Wed, 09 Apr 2025 08:45:03 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:02 -0700 (PDT)
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
Subject: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:46 +0800
Message-Id: <20250409154356.423512-4-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..15b515b95956 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -8,6 +8,7 @@
  */
 
 
+#include <linux/bitops.h>
 #include "cx18-driver.h"
 
 /*
@@ -56,15 +57,6 @@ struct vbi_anc_data {
 	/* u8 fill[]; Variable number of fill bytes */
 };
 
-static int odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
 		break;
 	case 6:
 		sdid = V4L2_SLICED_CAPTION_525;
-		err = !odd_parity(p[0]) || !odd_parity(p[1]);
+		err = !parity_odd(p[0]) || !parity_odd(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1

