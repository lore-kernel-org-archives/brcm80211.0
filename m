Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4471E0DF5
	for <brcm80211@lists.linux.dev>; Sat,  1 Mar 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740839128; cv=none; b=EvpVw9yfqNiJ4bIS+4/Cw7+SfPnnDRAN/yb/y8dsxDfI6XL4CsewJheOasfq+tI61VzveJzXkLGTxFX39P03FwvERxjrXzazs3AEcb5fN3zYGdSWi0JW5BXAEyRKdL+EUAtRg87qJCS3dEfyrhQzGo7whKqYx66rig/r87vIJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740839128; c=relaxed/simple;
	bh=ba2kUP6U2nQhwPc/YT5wm25vzRDR53W9pxGrlJ+24E4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hwPQu8U12uYNRyu9E20Ax1nYFnRRmO0Y/7/C03KXd71K5slr3OVjtsqzYnXbuHww2TNVrqk1GbvKyHcdnASvzEwZuzHOtaHJfvMGgym5KDj/SAy+Ao6bKPthTv/Q4CsVCjFT6fhoggzwMIgXn3cMkuo/pbhMLBj+Fwwy8Y00JdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TicSlOxT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TicSlOxT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22374f56453so33955985ad.0
        for <brcm80211@lists.linux.dev>; Sat, 01 Mar 2025 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839126; x=1741443926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXn6GKhF5PCrQUxpPI6cKx6cLS6wqLkAI6AcaLhK77k=;
        b=TicSlOxTG+XbPJviwJ98ChwsMDmPokbQCeE3fBWOLgY5d7iCksXPqIp+nefVDvZ709
         H6mkl59ylO4Dwq1WvpNEn3vIgwHMEYxhKNr1TfFiF/w9h5rJ9c2ZyuC+OQfUdMLU7Urk
         bo3sbCxFIbCU8FuSy4xF+n/s9gLYLqvhGcPk1RuTu1noVIOgmdzXj7XxGxi0skp1fnB2
         FrS9RwQp/n/+eXud4YmeG+dl9gUq9EZoE7c9r+pNCSTO4jgW71XdjtZO1YMbf1zoJ8Zh
         QlLqT6xh/xAoZkmnJ/g5mfOS72v5c0sJ8z/Vz5aQc+x1ndtA6h3ogknrk5fQL2SKyqDp
         +aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839126; x=1741443926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXn6GKhF5PCrQUxpPI6cKx6cLS6wqLkAI6AcaLhK77k=;
        b=JFRoRYGuRIjy3npqTdakZRhGB4JijygjBI5Za+KbSpB65Ob21PbnZ44AMbVuI6zFdk
         SqCIR51jfyyaRDg0N+ISEuCCvurqrJbDpsPD3qMtSspQmMeTufNQhUGODxOYOYKizTfK
         hy26iQxcTWgptOunLmXgsWdxuBrh+9Ok0Oxs+ag4fBC4kai1Xi6pAEfwggk6i3GNCziy
         cIecmxoHwrsxFygDhzUhVgZVTJgwYoTnunXWBqS/YdNwgIMl8lX1QUK2Bvk0z80OK8sj
         a3E3YvhMVjmdrBSYx/t0sfjsu/2/EyG+hIAtVVRUC0Psp+GL7cwq7juZ3YgXlczbFd0E
         7NbA==
X-Forwarded-Encrypted: i=1; AJvYcCXscH3QmSKmurIK15b5+4SKYUtmQnXuJm3OmVfoFOjj7PsuIVplaJfUFakcZFWKnOvqOxwmVDoMPHA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFucY2wg6CTEm6Obt0qoISZKqYBkfsYCKe/qWqfyzeVtOx08+V
	dkN3Hshxc2OAw8WSuTOVELZmNA8IP5RjqLfzB2CrRxP5OiBG+RCZ
X-Gm-Gg: ASbGncuEBGiiXfUc3+rxNSMRauzTof3MmxNaCtXPlDpS3Ll041u48WCM7TjtrCg3nFY
	+Y95TD6TnQ6gUArl9rAqvIF65SOc8sEWUhKV/JfnsmTFqrc6IAG1W+9Wnjn2ARhmpcihwHY/mht
	zJl2d+nkY1PDT61G90UDvFX7fJSojPYsSgCT4iao75/FvCvUtL1TJUWgwUrLV/y9ldJti4g6xHk
	6m0XzZV/j8UKI7mjF0Tl5+DVLmGiA+Xy4D3YvDUWHQAJyGrLZjO1Tm7MSGztLb2EDDs+VH1WWUs
	ns8x/pvzmn6EUzyk+2lg2eU0CncQb2UzIVR2+8UI3EH8MZKYpH2I1eYk7VF1kmiHu0Qs3GlX79g
	=
X-Google-Smtp-Source: AGHT+IF5pURPLoHQQUwY6iobOMXaj/n4QtZUV4ZbycQ+e8lZRNMONMXX28RkgoVRrFQeanZPW34ebQ==
X-Received: by 2002:a17:903:2346:b0:223:635d:3e38 with SMTP id d9443c01a7336-22368fa24bemr111392555ad.15.1740839125810;
        Sat, 01 Mar 2025 06:25:25 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:25 -0800 (PST)
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
Subject: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback implementations
Date: Sat,  1 Mar 2025 22:23:52 +0800
Message-Id: <20250301142409.2513835-2-visitorckw@gmail.com>
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

Add generic C implementations of __paritysi2(), __paritydi2(), and
__parityti2() as fallback functions in lib/parity.c. These functions
compute the parity of a given integer using a bitwise approach and are
marked with __weak, allowing architecture-specific implementations to
override them.

This patch serves as preparation for using __builtin_parity() by
ensuring a fallback mechanism is available when the compiler does not
inline the __builtin_parity().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/Makefile |  2 +-
 lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 lib/parity.c

diff --git a/lib/Makefile b/lib/Makefile
index 7bab71e59019..45affad85ee4 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o base64.o \
 	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o bitmap-str.o
+	 generic-radix-tree.o bitmap-str.o parity.o
 obj-y += string_helpers.o
 obj-y += hexdump.o
 obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
diff --git a/lib/parity.c b/lib/parity.c
new file mode 100644
index 000000000000..a83ff8d96778
--- /dev/null
+++ b/lib/parity.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * lib/parity.c
+ *
+ * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
+ * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
+ *
+ * __parity[sdt]i2 can be overridden by linking arch-specific versions.
+ */
+
+#include <linux/export.h>
+#include <linux/kernel.h>
+
+/*
+ * One explanation of this algorithm:
+ * https://funloop.org/codex/problem/parity/README.html
+ */
+int __weak __paritysi2(u32 val);
+int __weak __paritysi2(u32 val)
+{
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__paritysi2);
+
+int __weak __paritydi2(u64 val);
+int __weak __paritydi2(u64 val)
+{
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__paritydi2);
+
+int __weak __parityti2(u64 val);
+int __weak __parityti2(u64 val)
+{
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__parityti2);
-- 
2.34.1

