Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DB8632B
	for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740329027; cv=none; b=CO6lUgXO2peTB/Ob1AIWBtUAht98v0Q/WNPsocXdyS7sa5NILP6ap1cS0ILXfDM8NxBqoTNEGd8rTlg6JBMwGa+pk0+nRAwYbZLf4vi0njpCZDXjhPnC2BmOEf/PhFiFsxVs4aiNTYn+sqyi8W4PAyEdyWwYIseRa7hIJboVAvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740329027; c=relaxed/simple;
	bh=JIGbdj519hBofglwm1x6Wa4PWHJoF7xJSHZGDTpyM6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JRnrNiUqwlLf2xLDpNkB1pZV9t/FL2xvbDf/tYLuqZcBha8+rhracb8s8yyVUu2yYfucBDsECKnNK/x67vt91xlMhMl4un00j1R252Bhs9ool78/fg+n/njIhnFsEZ83Mz+PBEQhd5nKOPGHwY8I7OMFNgJNOGBkQ1uHDXXaNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC8Bk/eg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC8Bk/eg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fcf3a69c3cso2757433a91.1
        for <brcm80211@lists.linux.dev>; Sun, 23 Feb 2025 08:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329025; x=1740933825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=BC8Bk/egLeau2YTR45sA0g5Z7d4GGt+lmy7P7ahCNAq03KhPkSkE6BJjdYrcva1CWe
         1Kz4PIO7abdywEQvSAcLOAvR20q816qmD/LnTHC8WWLxHmazp3SN5KnDxYOqranhg7gp
         cprxllz2aTBX57XVRUx+DQjpWSuWMnmYEbJ53h7lXCQ1NePAf7doncAdPO73lGoduW/v
         ow2jmBB5bDXwRdsUojJgxV3OftaqRBYGU7t3rDPio6MLtPoM2zoO+y9yec+B84qHZ9vU
         EvKLrbVDb+Pm5hzl+O+Fb7gvixZj5ZzRh4Ualc1Q7tgbA7BXKW0sM+CLnSZvrC5UPaxY
         2CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329025; x=1740933825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=sLzFzF7+YeU13PU/REpCM3lhdvFR1PQr4Jx6aF3xHIkO7wS7eUpncLIdXK0sRhjw+0
         8/4Ikg+rDTZTwDMP1EqK3XoCUFUPYBtqelqelSfMsylSwmP+BLPSZ7CBdrEwwmWuqZcH
         gtftO/LPoRO+yz9REJ2Vf+U9rvsQuCfX3GTWtxs12VlejtJVtIy4oRTNWX/8UxUGCNJL
         3YF6aZot6cUC6xp6k+qTgeJH+D1+PlOhLBoTYSIkWQIfO0fgrpY3goY/4iSP5c8otZM0
         d9ulIHjPsD8uwi2C15zxY42aqvLnobKLItViniIhlLFHgrrWE1bbkXU5UHy1oDswDTUv
         N/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwsw6fb4a+dtiIs5HxtoO8VvONWJcqESH/HXnzfmv4InZX7fB6502fiecbeydprZNIRk8mPMEs+0M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGk1veXwa/PGJazHBDBHfwy7IuDPmTeZU0tewSfT5q0jeEUZOV
	u0o9HpOii4J2Y1mC0/RQKQQCNs2UVvaqfMNBA66FtxGwRptbuqKW
X-Gm-Gg: ASbGncsJU/nM2meWMb32uGw5ganNtdlrKILOOn5dN1D5hV58cWOkq0yS5wD11qLJ04A
	nqC7GRtkEIogmKk5CwL0F+0JM1rAejhmaSu674mEdnu6jZxFH1+LMHk98+VzetWW/FAzv39kmZ4
	YzcO2+tjDjT/qxiZvDASWwInOiDEPj5oi5q4Sb/mf05JLXVzaVjRo3BAdFUDiFm/g4ksqQhL9FJ
	rsyOSPymuFF5Xx5UVded8F6Be4o9W/i++XhEEUB6LVBctqFVwlOaK764Nxp74XZH7frKSFXB0TH
	/O9UQj6o0fECh4RADwgHgoOgJ3CEUTDDT0DNbsfz3dtd++zq1J5lxPSE
X-Google-Smtp-Source: AGHT+IGVq/VDL8yFNkkrNqMmhpwnPeH21AgiBV1Ypn8QzIpzc6gLajBMUvDiltb0IdO3Sbiytrzwqg==
X-Received: by 2002:a17:90b:2e0d:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2fce7b07205mr19070739a91.33.1740329025494;
        Sun, 23 Feb 2025 08:43:45 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:45 -0800 (PST)
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
Subject: [PATCH 05/17] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:05 +0800
Message-Id: <20250223164217.2139331-6-visitorckw@gmail.com>
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

