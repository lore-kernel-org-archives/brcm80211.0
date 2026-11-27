Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759983;
	b=08Rm1V7jbz1w7H7WzHKUMWGKmQJZ4Dc7JbpY/eY09FDZ6pw1s7vhrGJETgAG1oxFu1Ub
	 B073MNX3n5inH4G+Ne06iD+vlQoQfAQIGzIgcQ4RNIEPbyvDxd/ZxU+PnEYtQrMotg4o+
	 PqTv4HkTSzglfcDuMrLjqTJe5FAGQNRZhR9eanb0lZoWRylmeArXGgjdgxvGvCxcUrp4x
	 UEy3/j9wO8JC8mpX+8aBXa852zVhcFYQUlrhOnyzS1go/mEBxgFEmTVxIGFsoQLsYlMzk
	 nIsJ1WqGlG/RqkTovYwM/LXMbl7lgu8qse7G2jhYGf9u+5FXH4VvPX4sKhAW5N0ocVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
	b=KJeLnzROWlV0obaxlRbmKmEd4YdTmzPD5gqDJrpcAbFYA3NwdVTGxFEFvvOPUNnNRH96
	 95BRa/U8jmGJ4ilocOWQ8W8LU8gEjwRwPl/h5hFoeFSdB56Z4ot1vBLoiTPZfJoueHQcq
	 jt7gIw6uh9uVxhD80Bljt5QWHQbU668Xsm5FV91MNagRN3OfUNhxdIdRKDE26CViPc93V
	 bcRwHZn3WPNdP1FxnL8yYSOigzLM3LvfIAEk27Vko5RNgag8ViSp7eQE+xzdxl01vb4rx
	 Nm3B1ze3NUJpQauV9uEaSSnYhVw2ET+ix2+VzRII9jB4JWSer348BYYUze58oVWul+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Brs9o0co;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193BE606A329
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 06:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193BE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Brs9o0co
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386ab9ab619so10502772eec.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 22:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759982; x=1796364782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=Brs9o0covpdW0sdhrGCsMeqAK90wrUFiOODYRj+i5z2pm3A8+v7GbAB+ClARU06IVA
         ArKFWldYx7/Gs7ocgtZdzFdV9pP/6wdUpNV9GEbjVCLaGgHtqLsTbZXXtGe4sskGHK4H
         XUPrZXjxXdsvDKv6O/7YXiPvPoqZG2Kn8fFRbDlYOEjIFt+i2MG+FuWvJbyFfqVBGMhp
         tuhRi4dwMtsdCo+6Usc/2RsvYxfUbbeJxNx/mZ2fcga4BN7z8WtvcEkRMPDW4hsbMcKq
         tx+4r9zag0nuvesu5pLz0Lnzhnv8Rvw+SWOd+AKQVd7bFWl7MWgkOVofFxBOgC+4URY/
         mIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759982; x=1796364782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKSQxebDokb2ys9UHctF3cTAzVxMrJvvKwhXq5pMm2Q=;
        b=RA989ZqGOcgLy3MZd7SDRW3vwLfcTgENXwuy83R7+7P+dETIuMjl6BsF3q/tfm7UU4
         FAiwyy3saF7l9WzG8gfAdWA57tkF6/ZuAvRC4Vfe/ioaqUEz6zt9fC/EPq0G5lkv7EYm
         QmxjkE4ECkoc2LObu4raRvC4wkeHJOg6gGn6mUIoJzOswR9bP3oUmxBj86nFBnnFuJMc
         cGNuFbsftvKrowRivjxk71l/Y/fM096tRwgXbvJuDketl92a1l0QKWPOR+6RHVBGMyVI
         J/sCHULzkheQ7Eytnemwqnoel6OqCShNbkvvpfeEfAYPrf6VSTGVAVvd3YtuR9IUn8Gz
         YW9w==
X-Forwarded-Encrypted: i=1; AL+hErHp6Z16sLEfaOh53Q+RTw9/NZIP3s/3v59mOgou1Jacvvi37Ta+a2Ly3bvG+C2xavn5CukxQTJuEX4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BoVH32Dyrz8UcK/CpkjLbEhhw1xUUOvomRnwcHkldAkQRZhIf
	6ZbGpyyGbbXBIyk0esJeSDBdWaXS8b82F3XB7qASrIsu3WvPb7VWQNTp
X-Gm-Gg: AZFdTZdJH2EqVti12RZxT+iq44GJrzATVUKp7RXSFvB0UOVF2V4I5nlSLU/BjUv6clh
	voc0dmNbv2Hr9sqUrFO+I3CVhfVHOGDiNEqXwadSRzNzXk78S6piVb5JLheotqTWbZrgGa9L7Ht
	3F+wekGdA1v2q25V+QvBjJgNmxgdBiBRQYz4bbfH1qaVIh5hAMomAnXbOoxxafqcfEnpUeESMgl
	wWkLKPCHpEXuNjGOhkNu6GSyd4Ui/zZJNgml7ltzNggG6zTPGZ6fLSTDPVtu+oO1TyXZvSoyLsl
	XmHmfZunX9NFX6cK5e6/DhV9o3SlHvHhPsvIE8HNBjYK238ipB/r6QDcBW2DdKC+vuUgNxkurLS
	pEfUSYqxEH5UZCWWsF2gOrp57KpC+cM/fFA3WYx0ATqvpQc6JPyWrPC57fB3FvodeBi+g4r0pNV
	auV6O2FndbVFEbtjcBZ0dh16oLtQrdQNrl6lCmmZo63en8CCF+PKVuS1P3gBXrbuK2lTG6XszbQ
	c+LUBPZInEhEkqQDNJb/yF8HGKQPuMs8gHDn7pqm2DJjAE6aWP4xO5mbxF/XTPBuqJw6Be04zUw
	Wn1o1yei3zSL3wMqKPNx+NAJhUJOAOhJhPE+TRMIfgdaB275xAPhaIfSNuMmK8cbrcLohjpbVkL
	IgX1FNxDb5l0yiVc=
X-Received: by 2002:a05:7300:1c17:b0:386:a105:fa66 with SMTP id 5a478bee46e88-386a105fd17mr17976279eec.7.1795759982150;
        Thu, 26 Nov 2026 22:13:02 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:01 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 02/11] wifi: brcm80211: move d11.h to the shared include directory
Date: Fri, 27 Nov 2026 14:11:32 +0800
Message-ID: <20261127061147.506129-3-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the header to brcm80211/include, where the other hardware
definitions shared between the brcm80211 drivers live, and include it
as <d11.h> in brcmsmac.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c  | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h         | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c          | 2 +-
 .../net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (100%)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index c1a2318d7e..eeae85cae0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -28,7 +28,7 @@
 #include <net/mac80211.h>
 #include <defs.h>
 #include "phy/phy_int.h"
-#include "d11.h"
+#include <d11.h>
 #include "channel.h"
 #include "scb.h"
 #include "pub.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 9cb09c8a13..d81de701a3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -21,7 +21,7 @@
 
 #include <brcmu_utils.h>
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "scb.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 0a0c0ad4f9..6841bc0052 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -17,7 +17,7 @@
 #include <brcmu_wifi.h>
 #include <brcmu_utils.h>
 
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "rate.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 2b10fd5427..e178b1a0e2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -18,7 +18,7 @@
 #define _BRCM_RATE_H_
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "pub.h"
 #include "phy_hal.h"
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
index 79d4a7a4da..6e92dc4c90 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/stf.c
@@ -17,7 +17,7 @@
 #include <net/mac80211.h>
 
 #include "types.h"
-#include "d11.h"
+#include <d11.h>
 #include "rate.h"
 #include "phy/phy_hal.h"
 #include "channel.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h b/drivers/net/wireless/broadcom/brcm80211/include/d11.h
similarity index 100%
rename from drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
rename to drivers/net/wireless/broadcom/brcm80211/include/d11.h
-- 
2.53.0

