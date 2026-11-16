Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802572;
	b=Oa4vxQfoDjKAxh8bnmZoyhDhujj14JYE2rtiP/CxHHEF4c9RnwK7HNeG7Mu4kNyjIG3X
	 M0En3D6rarGpiD+RPZ6U/HCmT7n6iCAvqIItEXa1LjrBTU70D1WG4jcnHeJ3LgspbhXUt
	 e5A0zKpV23AZMul2zUZrpH4SBw450+NEgzjH53szqhka8G4dmQWGvvx9RtE8QNGW26gqB
	 R1JqDbLFkvyPSS4Rhn/uZ+f9rsQL/Y8jA6ZLUqbunrEAqsW7tbff5cW/imfPE5eN9wWzK
	 r0pAdC/q9BLDO2CSdJsFTHJwRdUTS8HEMLQGrBezACn64yDUygysAlmhqj73gNQLXHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802572;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=pjmbWb2Lje8tGPxgjuae32cwUfNa7HeNQCPIdazfluI=;
	b=d/SrAfmeWq8oNcm/bueWKqZEjyROFZH3glotruCqMZhTS1tcJemuSYB7F/mRiIQ2j8/T
	 5R03BkRv5UCpeY5Z/Cme+KhC2Y5AVTqmld2dszfduqS5Gl6FffVqHtFLDufbI6CVpMvWk
	 3c/i+LyAUb7rMYn4f5ljpbwTHFzwJyQelDLtFDgCMAf7i1UZEjJnXSBRNzkMDI2dgJQfA
	 XNbFFP22lN1zGPvRluLDb0pgonMYy7DuxSVF/4T2H7iHaVECXMbdwtiUSSTXmvGyIzbXs
	 sQDpJVB/KgMHjAwnUZe8scI/zgryqRmp/5HA9bht9ScNPtCnoRBrgZqdVgzUY1Z2tTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Mu48bp44;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3EB606A323
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 04:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3EB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Mu48bp44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pj
	mbWb2Lje8tGPxgjuae32cwUfNa7HeNQCPIdazfluI=; b=Mu48bp44yXnW2arbmH
	olSwt92HnUyG67sWgxVf2s9ynhCCHI+NlSS7IKQlYmkJRkirs7TDb8lOqPhVjlX+
	ahMvtGOq6HeAUQKYDnld7VhhpROm5Pw4EWgV1OAcKI9O5s+5kbR+I6ZMG+mgcApp
	DqB5HZszm0/iF6PWJ2kHhZtSk=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_Nng_pq40UOIg--.4498S2;
	Mon, 16 Nov 2026 12:15:36 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Mon, 16 Nov 2026 12:15:34 +0800
Message-ID: <20261116041534.24-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009072232.18-1-shxzhaosr@163.com>
References: <20261009072232.18-1-shxzhaosr@163.com>
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
X-CM-TRANSID:_____wDXP_Nng_pq40UOIg--.4498S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF43ur4ftw17uryUZry5Jwb_yoW8KF45p3
	y0gFWYkr4DAr4rCrWxAF1IkFyFqa1jya4UKFW8Wa4fuF4rArn3tr409Fy2gr1jyr4qk3sF
	qFWSvFnxJr9FgFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4zuAUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7QhUkmr6g2igjgAA32

brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
right after the superframe brcmf_sdio_hdparse() without checking
errcode.  On parse failure those fields are either uninitialized
(the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
(the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
and skb_pull() runs with a garbage length.

Check errcode first and drop the superframe with the same cleanup
used for a bad subframe below.

Fixes: 9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read")
Cc: stable@vger.kernel.org
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---

Changes in v3: add the Fixes tag and Cc: stable as requested by
Arend van Spriel.  Re-verified against current wireless.git main and
wireless-next main: applies with no offset and no fuzz, and
build-tested with CONFIG_BRCMUTIL=m CONFIG_BRCMFMAC=m
CONFIG_BRCMFMAC_SDIO=y (baseline and patched both compile clean,
0 warnings, including a W=1 pass).  No code change.

Changes in v2: check errcode before sdio_release_host() so the
cleanup runs under the already-claimed host, avoiding the extra
release/claim cycle (suggested by Arend van Spriel).

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index cea52d4..d30468c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -1649,6 +1649,17 @@ static u8 brcmf_sdio_rxglom(struct brcmf_sdio *bus, u8 rxseq)
 		sdio_claim_host(bus->sdiodev->func1);
 		errcode = brcmf_sdio_hdparse(bus, pfirst->data, &rd_new,
 					     BRCMF_SDIO_FT_SUPER);
+		if (errcode) {
+			/* Superframe header is bad; rd_new fields are not
+			 * valid here. Drop it like a bad subframe below.
+			 */
+			brcmf_sdio_rxfail(bus, true, false);
+			bus->sdcnt.rxglomfail++;
+			brcmf_sdio_free_glom(bus);
+			sdio_release_host(bus->sdiodev->func1);
+			bus->cur_read.len = 0;
+			return 0;
+		}
 		sdio_release_host(bus->sdiodev->func1);
 		bus->cur_read.len = rd_new.len_nxtfrm << 4;
 

