Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10EE1FB1
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386033; cv=pass; b=S8pb6Sv9hD+PfPHkFvYDdCGFou7iBp0+00O1LU1C/wdg8Ctm3zytIysA8E8Fz6NH1EkOrNjx/SeQDuo3TGPmNY5f4sydDa7F89qJSf4X2XNrtaRGWoPxnWeWcIii4cD0Zmq0Fz9Q0RNhWN+rXsnWfoB13/+zLipEu7q9vIMtsOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386033; c=relaxed/simple;
	bh=kyOx3qzGP8+DYM0Igihk2bi9jOoiLZwFZLTqoso8B60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJnCeWaphyQvvCMONLGHahkD68YLtxMAXeZ3jyBd6z31/jcaM02egr/BAcRbQ7mjzdBaQk9AVGP4J1w7qEYouSGh5UTj5AOGzQwQcVoTrxzpyAnIZUtrZAg0lbAo/Yw9ubLYTz7tnImU1O4540je3LcZPZJ5Ay+zBApZaTZeuXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGXos+Rz; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGXos+Rz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69af1bc780bso216474a12.1
        for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 21:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785386030; cv=none;
        d=google.com; s=arc-20260327;
        b=q/YjoxG/2hvz7HEsQ1AhJdYDJ3eWqsXw7BNJe+GNqtJEO8qEb4BJXebthSprNH0CMh
         5F+X7iHliYQD/StAPg7r6E1CPM5cr2EdrnANuGcFbVFNl6De8wYBLIcdvGhuZbwV4WG0
         7aHbiVsL+sUiN8nYuVyBPOUD72seVvQ+AEier2vg4x8AgBO14a4jovrNPsl98EKNmfNp
         PStN2SkQ0SZIdW4PdIQaiRHQyHvWrANKwgsV3VjCscqiBotaW8T+MiKU06dKBcUc9HNm
         0TbcNUhjzYQB/ThgicgvefFyUwBtyXprCGLAqQT7nZ7yTJhTKnbcT2jZFaturbOpH5hn
         Y9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qo5bTcyEgwxKv/RE8wlvgqZrF3Kc2k1fuqDN8MdgDoc=;
        fh=pZbd9QSrXSdgaWzHLsjGkk0WAxKpqCV43hspOgJMvhg=;
        b=pPAEj/1XnobyqXnQku7eCA7sKWg/puQg6lBFbVf1i94wdR3/aJ9SnM+DEhZaTzWQeG
         To9zIzkWf6UYFki91Rj3pbU+0wh8d7ZQsr14Xlbax+MncG5b7uw+WRLSS2qU5Ilbayoc
         VaqKMxJd4qfiG2Cvx9Bf3+hUpL/OnzjfwrIp9BfvS2RrzsPzb6iA1bVl/pbk/vGJ+Lf4
         XBMmxPesBgsj9UNKmFHkTQwIJ2h8EoR1zS1YktJGPzSU0Kg2TZOIeef4ZGWX/sMnsGxS
         Si9y85JsPr5mKpsPApw/wbAjdbLq3VqYQXcmPDXjCsBAc1GjSmnJgRY6kDvUGp95LJQF
         5YNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785386030; x=1785990830; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qo5bTcyEgwxKv/RE8wlvgqZrF3Kc2k1fuqDN8MdgDoc=;
        b=EGXos+Rzv5cnHwBfVRVCRSTj5H8NIMxaiY8SObBaEWWZtLnA5yg+su7mlQW/yHZbsc
         NiDvEUUKD8xufX22V/wXbTUNeEJFDn3oRFDQ2UFNWGww4DoAOrI6A19TNxFLNKFMcifr
         1YTc1oYNJwFJcuuedFdVgc1ulDX0QWUwf4+9Yt/rQoDs1u/preX63v+K557eoYSMwsfc
         M8r6ttswe3RS9ikDzdenU4pP5b5sibKJ7iL8nzXh0tTqrdu89Ce4JUadbLAA57uCNAuf
         S8kzmOyF66sqexOkFzXD3aUqAAQDvfia9QR9abk7miGpQfRnbTGoEpIwoW60bG+la47A
         upKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785386030; x=1785990830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qo5bTcyEgwxKv/RE8wlvgqZrF3Kc2k1fuqDN8MdgDoc=;
        b=RIGq6LnWkCwt3oCGUQTNSnsBjoHJZlIJRGfQN3XkYt3gXBdQovHqmHlbgVRlb8wajz
         48vofz+lq9fo4EpQbA0qDs1sml95kWaqabC04o5g5yfEpaAJtGIMn8zHZ8JCXefJ2ltG
         hXSkz9akA+5V/MYWQlmyfK/iEoEtzx88VWswO95u+rPYCooz6f8I3g66qkAf1ujpNLY3
         2wq8Iz+LezJnK0JTAD8nA93YrEkbwB6NXyHviG7LdnfIUkXqy2Ed7uRNoOIDwgE43Rye
         ApoX+pAp78u8yf9ay7h37bkvbu0w03b9fpRaTdqdI6Q4bT7GVq1k5tFicaYDee+i6v6F
         oydw==
X-Forwarded-Encrypted: i=1; AHgh+Rqem/LnQrRxMN1VYwKlNRjEz6+DU9OVCML0Cq+20+8A6EWKh/I29kg0oMaJdm1hwvNIuq8KGwfOhO0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJhPanq/j2RZtqbQbng+mfHeYl/1PvWDUgYDT6AL03QDX2MzqJ
	gNnG0EvelgzepckuIy93O3uX8g9Mt+GR1+WhTgDarWnwnzieCsZgvuHTNKLfz8b4UDF0n6vn6Xt
	S1VbFFr9j3dd9HkIfprnsWQadyLLsqrg=
X-Gm-Gg: AR+sD12LaWTOgG4+HPx054Xlr5L8vjTNbtS1jxl7FzKXyvlieXz4VLmggKZwtejQJ7h
	QscNiwyHNiiPSHWuQW/mHkMOAXGUtHE6Pjyna8rU1S50m3UeyIAc9lFs7KrsFggErcsZLE4Zamm
	G4yRoEv2OiwIUFi+dTRxC6UI7g3aRicFDKkqP+IWMu9To0Ue6PnkSpo3X5b+Qp6zQYaVYw5P8fy
	gRH99ZwRur00n7sGtLj5S5WLcsfj31H9MaIlCKEwwNQB7Wd1lKSUOhc7hZmJlvs+rrHLKthXU+c
	fM+DF5PzbNzbrFyOfjwZ8ZqyGjh1oSB0/j1yIuc+wmq+XKJq6wv3P8pvvt+7UHMOHSQzbU1U1Mj
	m2yFT9vR+7RN9moCB0k8jaZ+2M1qna2ynwUkalQ2b+dc=
X-Received: by 2002:a05:6402:2792:b0:6a0:eb:ae4b with SMTP id
 4fb4d7f45d1cf-6a07b53987dmr448092a12.0.1785386029768; Wed, 29 Jul 2026
 21:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
 <5cf57b2d-2bcc-481c-87bf-3a034d5f99be@broadcom.com> <CA+ORkNQntwC4k2arcngGdYB3mwsbJCkCRNTJRJ2GoRxjdGXLzA@mail.gmail.com>
 <c452116c-6215-4d62-b96b-72ae23a478e1@broadcom.com> <CA+ORkNSsb8Z5eUVH1GRvWtO_he6A+_b67ov2Cm6VJuWciJeKZQ@mail.gmail.com>
In-Reply-To: <CA+ORkNSsb8Z5eUVH1GRvWtO_he6A+_b67ov2Cm6VJuWciJeKZQ@mail.gmail.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Wed, 29 Jul 2026 23:29:59 -0500
X-Gm-Features: AUfX_mzaHH2vW7h39z8Rz_JT1cnvFYJQ6qtIa7jMngupATV60VsZSG2dQZna7GM
Message-ID: <CA+ORkNSG45LrTu09AiHNwTZ882Yybq-3E-=enwe+2eA36fEO4g@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gokul,

Looks like this is also missing, can you please add it in your patch:

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index d32b35ce0..455f5619f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -77,6 +77,11 @@

#define        DOT11_BCN_PRB_FIXED_LEN         12      /* beacon/probe
fixed length */

+#define WL_IOV_OP_BSSCFG_DISABLE               0
+#define WL_IOV_OP_BSSCFG_ENABLE                        1
+#define WL_IOV_OP_MANUAL_STA_BSSCFG_CREATE     2
+#define WL_IOV_OP_MANUAL_AP_BSSCFG_CREATE      3
+
#define BRCMF_SCAN_JOIN_ACTIVE_DWELL_TIME_MS   320
#define BRCMF_SCAN_JOIN_PASSIVE_DWELL_TIME_MS  400
#define BRCMF_SCAN_JOIN_PROBE_INTERVAL_MS      20
@@ -5260,6 +5265,19 @@ brcmf_cfg80211_start_ap(struct wiphy *wiphy,
struct net_device *ndev,
               if ((brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MBSS)) && (!mbss)=
)
                       brcmf_fil_iovar_int_set(ifp, "mbss", 1);

+               if (!test_bit(BRCMF_VIF_STATUS_AP_CREATED,
&ifp->vif->sme_state)) {
+                       bss_enable.bsscfgidx =3D cpu_to_le32(ifp->bsscfgidx=
);
+                       bss_enable.enable =3D
+                               cpu_to_le32(WL_IOV_OP_MANUAL_AP_BSSCFG_CREA=
TE);
+                       err =3D brcmf_fil_iovar_data_set(ifp, "bss", &bss_e=
nable,
+                                                      sizeof(bss_enable));
+                       if (err < 0) {
+                               bphy_err(drvr, "bss_enable config failed %d=
\n",
+                                        err);
+                               goto exit;
+                       }
+               }
+
               err =3D brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_AP, 1);
               if (err < 0) {
                       bphy_err(drvr, "setting AP mode failed %d\n",

Thanks,
Bogdan

On Wed, Jul 29, 2026 at 8:19=E2=80=AFAM Bogdan Nicolae <bogdan.nicolae@gmai=
l.com> wrote:
>
> Gokul,
>
> Great to hear. Are there any other changes you are planning to submit?
> I found this to be the minimal working config at least for WPA3 personal,=
 but would like to know if I am missing anything else.
>
> Thanks,
> Bogdan
>
> On Wed, Jul 29, 2026, 07:28 Arend van Spriel <arend.vanspriel@broadcom.co=
m> wrote:
>>
>> On 29/07/2026 13:48, Bogdan Nicolae wrote:
>> >> On Wed, Jul 29, 2026, 04:48 Arend van Spriel
>> >> <arend.vanspriel@broadcom.com <mailto:arend.vanspriel@broadcom.com>> =
wrote:
>> >>
>> >>     On 29/07/2026 07:34, Bogdan Nicolae wrote:
>> >>      > When bringing up a WPA3-SAE SoftAP with external (user space)
>> >>     SAE, the
>> >>      > driver never told the firmware which SAE Password Element (PWE=
)
>> >>     method to
>> >>      > accept. The firmware was observed to corrupt its heap over tim=
e
>> >>     due to
>> >>      > this omission, leading to firmware trap (data abort in heap
>> >>     allocator).
>> >>      >
>> >>      > Parse the beacon IEs on start_ap() and set the extsae_pwe iova=
r
>> >>      > accordingly: 2 when the RSNX IE advertises H2E, 1 when an H2E-=
only
>> >>      > membership selector is present, 0 otherwise. This matches the
>> >>     behaviour
>> >>      > of the upstream/vendor driver and only applies to SAE-capable =
APs
>> >>     when
>> >>      > external SAE is supported.
>> >>
>> >>     This makes sense, but may I ask what device do you have? Suspect =
it
>> >>     is a
>> >>     Cypress/Infineon chip. I could not find the iovar in our (Broadco=
m bca)
>> >>     code base so I suspect it is vendor specific.
>> > Hi Arend,
>> >
>> > Indeed, this is a bcm43455 as found on Raspberry Pi SoCs.
>> Than we should only invoke the parse function for cyw vendor.
>>
>> Regards,
>> Arend
