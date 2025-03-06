Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B42144C0
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278399; cv=none; b=jij0hIuNIYk9M/0BO76BFtQOpLfbHPx5T7HXQdZbMc5vM8Pq3TgfKn7JB0ndis/eu9rQUef4rsaqqDTuTshO3WUp8ex+MNIxoB1QjXdYLIAaPLx1rHijBTUhfev85oJHqFbEd1LxvHtIUkArJz0T7ckJJI0+neB7YgwctyhXVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278399; c=relaxed/simple;
	bh=JIGbdj519hBofglwm1x6Wa4PWHJoF7xJSHZGDTpyM6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CZxeA7Qs63hbNLXde1/Baq4eYjkyzhvOlgwt89YM/+Zvgl6Q2bW+Amj1AUxuwtvnQl77A66n36fIAT6vgCVeKpfApf8LW4iiS7pxXa0e9JmSAuterFrOcs5zkFA4n+WWcHQKiXEUZdu35lTKNLCeguK3LG/tVgFNynqpWRlyhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVeEztcm; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVeEztcm"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1691773a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278397; x=1741883197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=UVeEztcmnCv1J/faoLNP8zPL01yVEHF+hq2YslrfSOOMCov4kB4fzAyBFzAJEc6xDn
         j3Dmd4BbYCU4CEAPJ6YoNeR+dAVmNfHgMc+3GWyS2bA6oKKOzQ5NQyGhE5ZMJNg6pNMv
         R6AgILveWwqa9+2I6KtZn9QH5WyZFxRHoAMmH2lFwismbCelJb5V10e48dgXOIN2B2IB
         q6FanjDci0TSKcGUV4YDGE6HIX0UqYX4u9LucV6GbIF6psY4YqHsonCAzjs0aULqzlcZ
         7hUT5JOEay1WMwgEYvB04eAOGjowMe2PLFikSXv2S1H1o/h4yz0wu1+WiwF7BmPkXA6/
         Wnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278397; x=1741883197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=DYQrXP3tGCWIAnEPhbUJ8zOkL2vOW9yt0zUIWsZKlsMorW1RCE/knUMQj0vpjicWlt
         KROcFWUBp9qBj+zMNs/eE0SvWpdB0s6+p7q0s5Y5ux8vFqSFSOyb22mRAaDxt6pkjsop
         hyrEodPKXs6ZLdH8si6HraN+OB7LH/YKhm68kWBnSY18Rwm89YATeD+rOfSJHmjrLxL/
         GklPDRucDgfPcVVGRz99BJ18jPuni8LMVoKTWOFMsmzoi9YdLySHBxRQRe2l5fFpWAL2
         2pCv21knJf26lRmHhZ2Mr2vWJ8tKjW+Fy/cYMwz9LlTWAyM52K+9KWDqLJ36mpMBMSVi
         uRtA==
X-Forwarded-Encrypted: i=1; AJvYcCVPhr7ro9Bxjxm4wqcLRt1Xtj7YXoKspMBDnMPM8EyOdd+pgmcc4Zx4Bs7rY00lVatjxs4Xa55vKPg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfiO36lR8FOxJf1KjKRMHCQVl9kNb18yhIloQj6G0ImgEK+Dww
	mxVsMdf6dvgpYIMpGfVRlZoaRdwS63K8IRNPDwf6fRSaaBnUNJbG
X-Gm-Gg: ASbGncufRehFH4lcfBoEjg/ygicPe0aKCm7UnTweWZa+l2sKs13LdVtvWTT4PjT90Ru
	MUmx9SpDpb7uisi62qwzynsXTktJFHyE2fWeWdIdylTv/80iU1QBGMwk0ZZfpWgS6Qdh632RGSW
	pb/F6LQ3sYiIlQIr7eo0Ib62xTu7/Z6Jj8qWUtv3xkY+C+qqtuaHGguJgIItJ2UiijsrZGOZ/Q/
	j9aaNZCfCC5HGyws4jtwMxFMTj32O/sNqMiQo3FaOaSkh5mlZVybW504v3kHjLok97BJ0oDlYlY
	wWgL9HxnYe56hf6TsvhFNHPe4dObD1K/ljm6qKyaYQ5HNKH3XjGYAWTX+Rlq0fdzpQYVtELQ1BY
	=
X-Google-Smtp-Source: AGHT+IEdHwa48DziWanocz8wQ67fQs43cM3+X1TXQ11+KVNWCpcETjdD+vdPtUkiB0WUQbIndA90jg==
X-Received: by 2002:a17:90b:1cc6:b0:2fe:afbc:cd53 with SMTP id 98e67ed59e1d1-2ff497a62c4mr12413101a91.28.1741278397498;
        Thu, 06 Mar 2025 08:26:37 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:36 -0800 (PST)
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
Subject: [PATCH v3 04/16] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:29 +0800
Message-Id: <20250306162541.2633025-5-visitorckw@gmail.com>
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

