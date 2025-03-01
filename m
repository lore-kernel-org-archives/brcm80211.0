Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463C61E25ED
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839169; cv=none; b=T22RbJc4ti79z2p6V1VTDNw6CRuARmkSOoVDVDarweTNs9sxN3xt3zequEz7rGhdVuNumnn3BX+s0KyWkLHdDjXmbWu0CM70/IcZx++Wl9WqWxt4qhAy2FJ5bN14OYCkyD6IDQ0/vUfiKXBjhT6VipCVWgPaWCBpx3CRjNRjN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839169; c=relaxed/simple;
	bh=JIGbdj519hBofglwm1x6Wa4PWHJoF7xJSHZGDTpyM6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kyMkD9ARmK1eJNItUVzTAk2CZk/LSWz78ShhE5kP+v7fbHLWB0dgSvZwlAthO0NV8RBWFpUF+ULIwjYeaEfmoLpWYu55XEzPOUD2dkPeB0+pIcEn+uUfvSY5+sc4ZbjO9gtHkkhjKtwGoASMVm+Mxz/ZxTETzEcmkXVhcB2rQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+ZvXI8Y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+ZvXI8Y"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223378e2b0dso44908255ad.0
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839167; x=1741443967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=e+ZvXI8YNkYpX388Re9vVaMqI/ABWC7/APcpT5INUwLyCrzKndmrlAzvmpzsi32fH0
         Kuv99KjEvveeVPuYL+o6LvVn7IOthCANXT+PEXaqyD4YyJ0jp2x3I4cGaLBVB8CP+5ud
         Y7g8V7MXbjdS1HrIXO2TJvwZTMi5NNEtjvuTeco7AXJRipBawIPfOs2Xv2s9LI/MSccq
         DHYJJlRjYnr0q9l5HEiK1VqTH17QnK4l6MvRFVUicAKxtflXvXsew2GRFxzEHe9vk6Nj
         FOU4Ggf/sL4F/wzhcbg8iRODZUeYqHh2p4fLwIbOyGUHbRZr9DXRN/107Fl1Q2y12nzc
         3V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839167; x=1741443967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=APppL4kvCg0lHIUqOo2eF0MvaINWHwXEimUPe1SZD3HljqHomCbFEuL/oz+wZsw5cz
         nGn+kLhVej8Icf/PRdiqccbCE6lj8FaK44cw2rgmDTu8tVTAgKauEUc/9BCDhyr+73C9
         ti2efV3eiMpUHzsLeV1j9uvwVVQLicSaS24adUoQeMxawxHTRBqKLh5NSE63T4MFnncw
         eZEUPMXMXNpRzk4DHDvHc4Jx1quAJgQw61e6R57sn9ff/H3BT9kQPJ1Pd2OUa4hfQOFw
         5QvI9U+w0NEY3VRMOYvm5wSp8k5N+ljYIh419+mUQwE/23YyflGEWAEfxcWwjpzpDkYy
         n7Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXr9uulGLW6Jmcq07iXr6djuPSFEhjoy2JorxfSQJ9ce/u5LBgL168WUwgbVDspZtAsPp2yZggVxIE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx39mXkDs2mm1Y5eijHJRd9kCtnSKSviYoXpaMkOR/bDIEfh1jX
	nox5204RQaBO4UX6Q5O/zHC5pQRhyTkiUmSxAhoIbUk5UDu2hHIT
X-Gm-Gg: ASbGncvuyoizg5mnWXLrL85zoOpD40qcbjp6gwNvwvhjaDaMGALnEKpcEwjbbSeLjFG
	M2GFpXctC821KlSISscezF1CcXAJ1axM026gQfdjQyQ5MLwTLOctekX6LXsKaKuyPQr3z7PrOLQ
	sz2HDPhS5GknTp6h+HHfNTkw49NqzGXtMKeb/vNVAAqVeLutUukdaMnpayhqzXOT5nzEBmXuC+x
	FLOzAs7k6MqxU+LRm7nCGp09nxUFmoK0G5IOK5EIOtNNxUPAu6woX2O7k1ZHL0y1nao6QNhhKFK
	B4zHcRIjT56CY60BP+EYFF7SLsior/2e3hJL4WcDhwvSPRkkLmg+SQ+5sMZrS5c77dNw8xh0lW4
	=
X-Google-Smtp-Source: AGHT+IFTfohTxN61KiiUMR75yyegIVFtOgTpaXboBycWTn/wkpOLO86TKXx34bh6gLZ1DoKzx8tYbQ==
X-Received: by 2002:a17:903:fb0:b0:220:e7ae:dbcf with SMTP id d9443c01a7336-22368fc9332mr106296855ad.23.1740839167480;
        Sat, 01 Mar 2025 06:26:07 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:06 -0800 (PST)
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
Subject: [PATCH v2 05/18] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:56 +0800
Message-Id: <20250301142409.2513835-6-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..1a113aad9cd4 100644
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
+		err = !parity8(p[0]) || !parity8(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1

