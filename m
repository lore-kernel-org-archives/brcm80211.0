Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793507;
	b=UniaqA3TdUmCAFhzLERaJI7xKH3AxKpW8SlQqNGfOrdCoM2kvWOpUeRii5ZNBysCdLt7
	 sGSxFn6/F3ElycTSNaNFWbLRPnIYSnnSBj8InJ0+q/TfjoK7/nho6F2ZuWJ7EjvCw6ahn
	 R6eRpVwO/ifwnU0K2LIpCMPDG66QjU++d7aSd3XGK9thcDK4/NRiV1FNjXTsv2W7zZHV8
	 jJFneGpBpV9b0hCCHNkLcg8Ea52y/UUHgpYVtevEeQhjkXUSZK11g8cQaVdSxTUo2p8OJ
	 hGpARzfRs3P6JM+JmjxDoeMyAl/uUvFj0NdGSrP2yTPcHM/EPnQ9FsKKp3dM5tLdELg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
	b=GjVeHIlcgC9ZNgyTI9whs3/9Io8VYGsu1SPUp37lqLmeOBIQ3Sz/3jVCSRSB6Rv5vekQ
	 pmkLarxMODW7+zCb7n1xhKDjh8sSJ3bdzy9Fixm6zhwnQRVjR6YQGfkqXL2mq5DofkT1F
	 GZZ3GWtlMZPW8pjJ7kSp8kSpXsFjG1OHe8kJl+9CDJEZicboHYUaVMc3WDjCaPjDo1P6g
	 8oU3d6a87Cw3zn7pLqrnQnTj8QMw22vzAIDe2eNEaDmOtnDF0yRJNnc/qs2pIGClZrmp7
	 +oCRPfFPCm/F0vwOJjDnzXviCEsh46ZX/kjgN7x5nc2utxhUypSSzcdmdHIJ77i+dOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StfgKlxq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD08606A31F
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 15:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD08606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StfgKlxq
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4e2ec4b42so43362657b3.0
        for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 07:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793505; cv=none;
        d=google.com; s=arc-20260327;
        b=hXk4cSr0E7Ie4kKS6T8bQIZrbEDCgxVrasK1cnRRe5rIAl7EG0Qqp4IGnXxzpeoGv+
         8CQGCSaCUgbTAxqmR3MDA7e8n8/lWTjM5877tEL9dsMoFih6E8c3sjHvg8BZoMqDp2w6
         DyFa/Bk6TEVWHEHBANhAWTZNmB8d/59IAr3blf9mjF8R5WZrD1u/Ro4/f8oEtUpbbbfF
         +MYJcO5W+mZd8fgjQN2+LK8irZU5e4YlGClIr+4lzxikBH6zHzfrTBnHuzoIf8rbDQTM
         WM4/N7WhkZATb/Q/GFHYyPmvQ5ovOnxkipRvARB0JQy7B5CfFIJKIdJNbt9zXtbvQ1k7
         vhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
        fh=5SRwJBrz5qB6NijkvlfAMwN9X2zPE2mKvHTFV2u/xdQ=;
        b=Czk8mro14y/9N5RNjosrxwU048KZvZpV2y+S2R+noGkTwAjUNDdNyiozb59ALXSNwD
         WA3nbV34O08aO1zPpVMOR/DC7h5BxgaC4rEyGDQJOD1lPRl6UU5NTKoRx/jf56dC381C
         Ecdygq+bItdkIn4URRE/6HQYSPb46WwEBOngtllU3zSQTDH0QgqqGcc+uVNdEdJkO70L
         TJ6b5lajt/BZAYA7dC1J/JCrKoTzA6nHDuO2Of7EtpcBbkkPZSS2m8dJeRwF4q0RKDvO
         iPu7Dr4ztwv2LxFcBqh2KeEJxKYwEJvMd1GlKrOAiopFu1HS+sjsloeggFnxzfVmwBHP
         0Hcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795793505; x=1796398305; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
        b=StfgKlxqlvu+2y+jtqzW0AXdz52rgLHc5fxRbT1Qd/A+LHLrXupi1BJ1FGDMd9r08j
         gMpxc0fLuCfLFQZiT+ntodXFpdXLUIWSBo6DUNGceyBp3it0UfTsw0nvW8mLJ7kvYZ60
         mZwtnL94fGOae69hWJ+BjRrcmIFcWvh42IyBg/4/XmvTV0qrI49XEDrBbftqW1Hfa+qO
         br6UECCftHiT52LgwaH8uzmEwCHKjrNG6VvH0FOsGvyo+9vi/y2pMi4XhganPpE5/vIC
         2uKcBM3hP7tQgZ7FD2D/mjwgGiArZkddn4jQaEtoGSiN+vMo/eJJw5WnaHy3urBjl2Yd
         PIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793505; x=1796398305;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B0qbJ8g2Vdj9HAdNnwCKwtoZV+3naWX33A2WnJvViLI=;
        b=bTtp8XOHr21RHZ7/vU3r3R1bVouCPrKr23SP8Rk4io+i43pJsW4i5/HjR6Ht1ceL99
         mzq9bteSkJ/mgqFqJGVw7MXp2bf4qiveDMhvIdh7jNlKzR+QEz6EwvyYKOZnYdSbRnta
         jcM+MPPZULGEO2od6QvRM1Tx19/HHX9QKZI9iisekKDwtDlCgxmWFWK/AgA2yZ83WDtq
         xNsbjlyxYWimPM1H9D3+w3t5Kg2hl6PqN+Xv2vKY6JVygWhlVEZvjwSLUzbqUcJJ8MlV
         g1AY/fS4gG3JiRO7t9r6tymPf9OzuywqCiBzDztMHjuRGRq29T6DMxfU/eKzujiTM7Z4
         hMBg==
X-Forwarded-Encrypted: i=1; AL+hErGYAPKSwkne6SaL+i2Wxa978Ol8ZYlsXBVT0wD8YP4+r3LTX05x0gUKgxo8QP47NjLjZQYjRNWjT1I=@lists.linux.dev
X-Gm-Message-State: APuU4Z928z9Gz/VR7MhJh6rbHA+IVGx9vhw+ZM40VFs099mTVdOqfQK0
	g0VRQjj1XXaEaTbRM2bBxqruHoQPoVGBQnO/+AWBrmyAPDGRZgH3iXQ2AxMpHOvkVxeFUtlPPXH
	XpsPybo+edF4Tn2CfTZul6cQ3nS+cFdo=
X-Gm-Gg: AZFdTZcW9Y27NsT7EI1bA6vWqS/6y+Pj8baYx7t+mL+R+7Gnd1mkjbW8FXWC8YSx6an
	Feor4uR6it7xdZVUPxwHU3Lvr0cVE5BC6RfryHGa0QpUgNp4ReM+oGzooZb3SeJ0HFRbBqUiN7r
	1iRZQFFGWvJoUbheznYUMtM9lBHZE19N2x7ButkHkd5xGViWmD9GubnXTNG4Sa9MyGiz028AeZO
	HupktJTgyhMUrQH8b3Xj9fBs+i/k8QE6xvLU3RJkrrvNvz6PG27nT9v7wWhNVHCC10NGJQmzH8/
	O7SslI4YpG5nbcvd1iJevM7I8YUgiK9O27cvgq58z+cq7LPDVpnQiL6mhvmErXBmp/TbJ0pDhuM
	mNCRggq1TYhKg5mIy6jmx/+YP9kkHSTtRXs6MKTnQ0JzMGf50XCUvIKMLQMq5kWALEKIk58ZaJm
	nH7Rn4jP1p3cKJC3R/RcagVxsWUNfGaT9UV29woCO7
X-Received: by 2002:a05:690c:6982:b0:8b3:bb2f:4101 with SMTP id
 00721157ae682-8b5204aa181mr108453437b3.34.1795793505179; Fri, 27 Nov 2026
 07:31:45 -0800 (PST)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Collin Rose <collinr@gmail.com>
Date: Fri, 27 Nov 2026 10:31:34 -0500
X-Gm-Features: Aa3M54p9EKYq_L9WbiXSSrQ1XaZaTTZu0S9JTeSvbioCYnR5ZVi5HGZBdKcjSO4
Message-ID: <CA+d3OrdhgXy8Dhfi_V=9sEqU=FK4tDzt4HVgOz9Uqw7OTP+8Jg@mail.gmail.com>
Subject: [PATCH wireless] wifi: brcmfmac: use legacy MBSS when
 interface_create is unsupported
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

Firmware that predates the interface_create iovar, for example BCM43602
firmware 7.35.177.56 found on bcm53xx routers, cannot answer the version
query that brcmf_cfg80211_request_ap_if() sends after interface_create
v1 and v2 have failed:

  brcmfmac: failed to create interface(v1), err=-52
  brcmfmac: failed to create interface(v2), err=-52
  brcmfmac: fail to get supported version, err=-52

The function then returns -EOPNOTSUPP and never reaches the bsscfg:ssid
code a few lines below, which is how this firmware creates an additional
AP BSS. Before commit 1562bdef9251 that was the only method used, so
adding a second AP worked. Now the add_virtual_intf call fails with -95,
and because hostapd configures every BSS of a radio together, it
disables the whole radio, including the primary AP. A guest or second
SSID therefore takes the primary network down.

Treat a failed version query like an unsupported version. Set the
version to 0 so the switch default reports interface_create as
unsupported, which is what already selects the bsscfg:ssid path.
Firmware that answers the query takes the same code path as before.

Tested on a SmartRG SR400ac (two BCM43602/1 PCIe radios, firmware
7.35.177.56) running OpenWrt 25.12.6, which builds this driver from
backports 6.18.55 on a 6.12.112 kernel. Without the change the second
AP fails as above and both radios are disabled. With it, the driver
logs the unsupported version, creates the BSS through bsscfg:ssid, and
a primary and a second AP stay up together on 2.4 GHz and on 5 GHz.

Fixes: 1562bdef9251 ("brcmfmac: Fix AP interface delete issue")
Cc: stable@vger.kernel.org
Signed-off-by: Collin Rose <collinr@gmail.com>
---
Notes for reviewers, not for the commit message:

* brcmf_cfg80211_request_sta_if() has the same early return, but it has
  no legacy fallback to reach, so I left it alone.

* The run above was with the backports copy of the driver on a 6.12
  kernel, not a mainline build. The changed hunk is identical to the
  current wireless tree. I have not tested other firmware or chips.

* A change of this shape was first published for a Netgear R8000, which
  has the same chip and firmware, in patches/861 of
  https://github.com/88plug/netgear-r8000-plus (GPL-2.0). This is an
  independent port to the current tree and a re-test on different
  hardware.

* The downstream OpenWrt pull request carrying the same change is
  https://github.com/openwrt/openwrt/pull/26697

* If you would rather not print "not support interface create(v0)" at
  error level for old firmware, I can send a follow-up.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871..87aabb7cd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -760,7 +760,8 @@ static int brcmf_cfg80211_request_ap_if(struct
brcmf_if *ifp)
  &iface_create_ver);
  if (err) {
  brcmf_err("fail to get supported version, err=%d\n", err);
- return -EOPNOTSUPP;
+ /* Old firmware: use the legacy bsscfg:ssid path below. */
+ iface_create_ver = 0;
  }

  switch (iface_create_ver) {
-- 
2.48.1
