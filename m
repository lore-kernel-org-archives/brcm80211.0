Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B32153D2
	for <brcm80211@lists.linux.dev>; Thu,  6 Mar 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278420; cv=none; b=okWbssVwjQ+r3PJBNbjdKer/20y4Iaqh2qN40SHEkP8/WwgTUdIprRTvWWBYNky0jTKQAugn4rL6ch7l3JSiiecbC6ZD19yrwuy8hUrQtBnPimMB5EN8ud5kOPTQ07SqCv/I04jLdaltLPuIzam3/McoIeK3GOoKUw2N4fVckvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278420; c=relaxed/simple;
	bh=+p/YAFe+kk9OWZ8tBw9OGe2ynkLFMgdD4C/iDJ1Cf18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pRlqmKOUcn/DNk/UztMfesvpdAwsaRVXqH7JKemjkPso7d8uYWpQwPfXguNgmx7STcbHyKOr44eBsjDsTlnY8ZXkLJdUJgEwvh4KaZFCPjjZTT2AkieaXtV+swsqhNKE55XZBxzhPTb3Wlm2BfGcAbLYqOgbCQIV1f7o4uGvLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIPKEadS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIPKEadS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1692367a91.3
        for <brcm80211@lists.linux.dev>; Thu, 06 Mar 2025 08:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278418; x=1741883218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=;
        b=aIPKEadSINOuNSQp+sAUvl8U0b2AIH1NgaGSAETZXGpz8PdCSS1LHyivH9A+YzZB+x
         8ePvcuUsmDav+sw6rgcjZRIU9zxuznYBX2wzUqr/jEAQL5DFmgoOr1EJSDygQWacdYPt
         OoGLgMdKSRMUL27bV8gPxqVchKk+AVAMMnktt6SCZBR28ItGMsFlyrd03oYfP/gKjCvX
         Ca0ywdYNjJyobqCR8SF4qTR/wVa3fky39mQbjChRFZ5ecy4DszYyeijlaLsCqPip8X6y
         SArRI8xqrNncXh9GgnPHLIC8cWdE0wEpfqAkQ/P+3HA6jedNfHQzdZOPs2as13OTf7VP
         Qjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278418; x=1741883218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=;
        b=Wn3nm7W3Dnsf7o0XNEfqwERRaMySH8cMcabQSChe/lP0VoHfZXa3zSVxQ83mktrZxv
         46JkpoUFwVt58FYcdIQ/CS+SV5AfFDtYzEG3AwaZ0TpwUFY+Dd4nF+cyIPep/TlR6BZF
         SJiBl3bZzHlLx67A3Vk5WV20NinumorCJn7XVKvhYaAUHbgqsnpoobYE1dh22vhuOQRl
         GTabIXRZ546SFMAUmq8AOSSSoKfVJXv4m3RkVWIxw9T2CO1lvdICB1meuwl6ivxy+wJc
         L0eAxZpuIc0cHiMvA/eMOHmOUKC0YKeoyGWU8SVZa6IeHbLI0QUwKzr/JMy3BuxmzXou
         0ZQg==
X-Forwarded-Encrypted: i=1; AJvYcCUFzyUoCHXTJnDbaHrE5zpedIIqRfap6R393iVX/VZbK5LqdSi90iwkD21Or1SB+iQM32fHymA/ou4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyAoUe//6neEN+Vln6JXTplCQXg4VBdHnrI1d8OfWqsc7qM1fh
	gQq7jFwAjoEqG0yoNSAc2WfOEqsduj8bF3ioVAfWc62cnLlVpPT9
X-Gm-Gg: ASbGncs7UlhIWkXcoJ7tfDVQPKDfrzCVwODabXAQwFTJ8aL//jnzY2DA1G5EIjJfsAS
	lO0v7UtJ0Q4sl3RXAjfS2UlLIbg7lybJtnOCgVLVv65T4LD62unxIaDqc8DBvWnXjCUgaLWaaHd
	HgLXoWD86PRZupWCphCsSWjnHnqsFaxvs+ofV6RpYnqZ+ihFtn4rELqnKqP99QvXsx78j57xzYz
	IWvqRSBAmLAtehjVt0/3s3bWU2YEdmBBHUVzC2EdOmFJ5LosGrhDM4y6gZZRALX7vCdIClzfajt
	itBQT+nY2VlMo6zEjT8Em7JIiEypLpHQYhDUCG6iHm1fLkk1TiJ8+WB0kHV3x7BuzsxRF3zyarA
	=
X-Google-Smtp-Source: AGHT+IG03DCzCpNpvI11hw07lC+sk1Ut5naphaEWX0iSJy+1ysJZeXoZKrfH0dsPOSnHxsIbzbSOpg==
X-Received: by 2002:a17:90b:3c87:b0:2fa:15ab:4df5 with SMTP id 98e67ed59e1d1-2ff497ccd9emr10053018a91.34.1741278418239;
        Thu, 06 Mar 2025 08:26:58 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:57 -0800 (PST)
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
Subject: [PATCH v3 06/16] serial: max3100: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:31 +0800
Message-Id: <20250306162541.2633025-7-visitorckw@gmail.com>
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
Changes in v3:
- Change parity8(c) to !!parity8(c).

 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..419d74043498 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ !!parity8(c);
 	return parity;
 }
 
-- 
2.34.1

