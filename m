Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253283;
	b=dW+gR0lT7q4zMf8IqqPrEk1K73QDYKvY9dVaZcrX3YPtlOKTgZbWctMt7GXu93ysDJo/
	 kSWgwwjnKm6dLRjol2ZcmvT7LDE4IotjM9jCCndzAt3n3dKRJZkvobLbHqXQ/y0tcH50T
	 3T3NCAHd4Ihjf3rimaT99J/CIH+s80GwV9AYnPRkHDPNuv0w8JROtNOK3km952HJkz/fQ
	 dDfKbJ1ZoWN1cqM7e6TNcDyVmxj21XSbF/suPWWUPIeBnyBTijo1vK6XPa2q5ynZnWQpw
	 0/QSV7Um7dTRxV3guc0cBUr3WE14SPVC3ykEMiLGqJ/7iLRxq+gmfJ9YRUaI/symk+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253283;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0bSx2JclMF4MRpUkB5cyQcV3F1zjv1EmvhDRj9fFHOM=;
	b=dHPbMbLrOZVVcXA4hpgmXZo26kq6j7RkwnAK7YDS3mYiMyYiYIX/WgLJkAR+Hm3UHYfd
	 PB2vd4380L7pcTTLYvzGph8Ld4lQJuORTYn1pL4imXkvrGUoAOHkeWnbbSSklHC50Rsiv
	 zA6MpNPEyISJrcE0K/r4+n3NyGT6y/yvs7jIfnbQGNLRRgEM4tf9BTo4eE5YQgnBbjP6L
	 yJSPkr2qe5VBN0mfauAOO7OExKht9LjZlivLL5TacWUJseULbyDf0g17lxm/t888+sjUX
	 zJS6fzZ1JLvqYk68mNpSN+EKWirYQ1Gt47tBRhR3/D2emL/A86DpK3QQOb88Y9h9nag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=QDr60wB2;
	arc=none smtp.remote-ip=185.70.43.18
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28541606A325
	for <brcm80211@lists.linux.dev>; Sat, 21 Nov 2026 09:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28541606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=QDr60wB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1795253280; x=1795512480;
	bh=0bSx2JclMF4MRpUkB5cyQcV3F1zjv1EmvhDRj9fFHOM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QDr60wB20CgBUF7pMQfUcjrMG7OUeSpzXSersWUnx/xquzjBmnBAwqsZCT2ezmb0S
	 LN2JfEWgEUG8Yn4Zz+NQ3y1D1tgaSRv1vioeOfE9EcMvdANdPohMWa32M/lLYpsvwa
	 JUsVnp2lCo3kUAfh422+CTNO3E1qfez8mmOBG0/xn/7Dg5BM512+LembbA23C77o4V
	 LVDJvb/7W/G9loP/eez+k7ZEORauR65ClCVhmMkjp7UpS1FFtmdCBwEVfGNTXHQxPT
	 ASLOVdMtjVmMBDcwtDgmUK5/+oxZgcUIr28LZ/BGrwtLPuqORZCN4bI6jNQrRfbmXt
	 /U4quOkgqpMOQ==
Date: Sat, 21 Nov 2026 09:27:54 +0000
To: Arend van Spriel <arend.vanspriel@broadcom.com>
From: Chad Aldreda <ca@modelmiser.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH wireless] wifi: brcmfmac: fix join parameter length in IBSS join
Message-ID: <20261121092746.2917397-2-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 34466270bf4f03036581e02031ff89cba1ae6c7e
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

brcmf_cfg80211_join_ibss() builds the length of the SET_SSID payload in
steps. It starts with the SSID record (36 bytes), adds
BRCMF_ASSOC_PARAMS_FIXED_SIZE (14) when a BSSID is given, and adds
sizeof(join_params.params_le) (16) when the channel is fixed. With both a
BSSID and a fixed channel the result is 66, but struct brcmf_join_params
is 52 bytes (sizes as on x86-64, where __le32 is 4-byte aligned). The
length is passed unchanged to the protocol layer, which copies that many
bytes from the on-stack record (brcmf_proto_bcdc_msg(),
brcmf_msgbuf_tx_ioctl()), so 14 bytes of kernel stack beyond it are sent
to the firmware.

When the channel is fixed the whole record is in use whether or not a
BSSID was given, so set the length to sizeof(join_params) in that branch.
The other three cases (36, 50 and 52 bytes) are unchanged.

The double count dates from the commit that added this calculation: the
BSSID case counted WL_ASSOC_PARAMS_FIXED_SIZE, and the existing
wl_ch_to_chanspec(), which that commit called after the BSSID case,
added WL_ASSOC_PARAMS_FIXED_SIZE plus one chanspec again.

Fixes: 69274f020a92 ("staging: brcm80211: Fixed ibss join/leave functionali=
ty in brcmfmac driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
Not run on hardware, and no reproducer was run. Reaching the line
needs a brcmfmac device in IBSS mode and a join with both a BSSID and
a fixed frequency:
  iw dev wlan0 ibss join <ssid> <freq> fixed-freq <bssid>
The four lengths (36, 50, 52, 66) were checked at compile time against
the driver's headers on x86-64, and cfg80211.o builds with W=3D1.

Not checked: that firmware accepts 52 bytes in this case. It is the
length the driver already sends for a fixed channel without a BSSID,
from the SET_SSID fallback in brcmf_cfg80211_connect() when a channel
is known, and from the AP start and stop paths.

Also not checked: on msgbuf the same length bounds the copy of the
firmware's response back into the record (brcmf_msgbuf_query_dcmd()),
so a response longer than 52 bytes would be written up to 14 bytes
past it. Whether firmware returns data for SET_SSID is not known here.

The BSSID-only length (50) is left alone to keep this a pure fix.

Based on wireless/main dcf495789037. It also applies unchanged to
wireless-next/main e1dd8486807c, where the length goes through
brcmf_set_ssid() (39cae1c203a3) and is still passed on as is when the
firmware does not use versioned join requests.

Tools: the over-length was flagged by an AI model (Grok 4.7) asked to
check notes on the driver's firmware interface against the source,
and confirmed by an AI assistant (Claude Fable 5.2) reading the code.
The patch, this description, the size check and the build were done
by that assistant.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/=
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871260..9e5955a98051 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -1901,7 +1901,7 @@ brcmf_cfg80211_join_ibss(struct wiphy *wiphy, struct =
net_device *ndev,
 =09=09=09join_params.params_le.chanspec_list[0] =3D
 =09=09=09=09cpu_to_le16(chanspec);
 =09=09=09join_params.params_le.chanspec_num =3D cpu_to_le32(1);
-=09=09=09join_params_size +=3D sizeof(join_params.params_le);
+=09=09=09join_params_size =3D sizeof(join_params);
 =09=09}
=20
 =09=09/* set channel for starter */

base-commit: dcf495789037ab78d8ddf5844239cf85d92ac5f1
--=20
2.43.0


