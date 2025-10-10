Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA5259CA0
	for <brcm80211@lists.linux.dev>; Fri, 10 Oct 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760121372; cv=none; b=D2UqqfRQRApfQZS8SG3I6QyWKgBVCvg0HpDf6R19qSnuc7wq3WXDia/DfFf5SC/VBs2ZSwMzFAmtxS8/q6wsyt6n5ZP38C4sWbEsUK5fBlvz0gJb7Z9QwwEXFDJYtUObrdW9HUemLir7HETYwalYryzV/1UgXEref8JSnNyMgBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760121372; c=relaxed/simple;
	bh=8ohi4vYtvoGftZm1/y8L/7lgcEV30Sor3yH9TUppnA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dstTTnRWmkEaDIa4ChFLH2tSeg48kZ9oVNT+GZDRLQj2n1cTcUFsHaI1FBIQqSCAxDKTTX/J6pW6LGR4dF3L//PJT6TW6mm9mlBzIc0UMpdW8fFRM6OCrJBJjBzMNTWdWuUZTe5kpYj5AGnjmVN2kKoddri7Dm8fF+g138mu8zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai; spf=pass smtp.mailfrom=govivid.ai; dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b=hOQi9pjY; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=govivid.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b="hOQi9pjY"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-79390b83c7dso21004646d6.1
        for <brcm80211@lists.linux.dev>; Fri, 10 Oct 2025 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=govivid-ai.20230601.gappssmtp.com; s=20230601; t=1760121369; x=1760726169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMpQgemd8DjL/QPm5m0YSEI53NHCuTK7lub7j1PHEhU=;
        b=hOQi9pjYLUKHp+PO/H2a+HClcsvyjJFYeGdVZA51FXFZfG7uchc8zo746vXVZzvYb5
         9X4aMd1ix2pdXWPPZYCoZjlGS8PI75bCwH8NL/XIWJ2JIAtaGiwnOzCm6dsCLRJ/Xo3G
         CTsKIvjbA044iTiPtaUcGgk7acq5O/ek8+L1za8B98zkmQLwCw+yvW/By6+dZOCWqH3I
         0p94W/2lvoJwpN3op5JuNwwg6oM2Nf6gaOenLeymoq8Lm1m1D9McHOCwHXJvqAkpy9iN
         K/sUtTLZt+vDY2GGNpnztsCYqx6EzYY6eJLIBpMPz5nTNcRxKduCAba3511AlGxQfODd
         8Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760121369; x=1760726169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMpQgemd8DjL/QPm5m0YSEI53NHCuTK7lub7j1PHEhU=;
        b=GYe+In/v+03wHaDRya4kSbc/EGMlBxMNLkJYUYML3NcQCQ0kEee/IpyxB7c1R6umAA
         /kqsTW9Q6ec417jBt6CEY8XJYefBY38CiOLFCWqRX3U6W8GOomP6V6RBV5Xtn2WgHWbf
         snt6cHjK1kqBkwA+ZhFLP0MQ3TypoqSzGa1IIeav8X+9kbVpj0CYWWUJ3bQ7DguFohMV
         qCRVo+oCB3UYAHOGs/2N83xwABV/93vclpVatAX9TOrs3qWc9kdsaW7PAgp3axvFm9qy
         2z/Xf34/ImxWPog4bdgL8iQmoEZ8M6RX8NkPbRNQhDq8MSURPCfwsGi9bYsN9ZMGDRki
         t6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr6yzgPfuGcSAhgKOqgeJB04ZnYfgLT/Zw5UHSZ2Ty0/OE9knFEzhAy9Gpb7xOH/m8n7eEAMA/9Xc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHHERS1eeo/uK8V+9HCqN+2HUKwM8KVucJpFnyD4bIoFwJCW8s
	EyeeVeynzQi04ATSeFoK9PE2KrQe4xhY2CHLTRR4Bum7yJCZFZ3NXuyku/R75eiGkSVXt1L10HJ
	HbszlAFOaZvVmvjKFPN+fe0Mj7+xzLNMl8+Zu+QP9Cw==
X-Gm-Gg: ASbGnct9LrG6CBnQZQjTTF4gtLTOPyKS86ZW8RmG9+Dch6HitStWVCztNTtzBL9jZsb
	XuqqTxMDMdCcWKw24kssEH84eIDE9l41kBP4FMqn6azlDrahOiUVJflGd3N3Xh4bc8q80JSvzOa
	cfJ5bbUIE5tQR/Ean6+UGGIDtpLTjtTd/TkAwlQzyNwpaxdNIc+QpTJMUOQvp58p9gI/iW/K1jB
	uj4+eisS1xhvN+bu7pi1QKmhMH4oiqdjmM=
X-Google-Smtp-Source: AGHT+IFSqLS6m5Kvkhl7GHA6+mxDHD8vkdNeJhRot5/QhfZNy2UOLP0PVOJYt2cz2cIFphy2P3i+YIltOxY1L3kj668=
X-Received: by 2002:ad4:551d:0:b0:78f:2a6c:11 with SMTP id 6a1803df08f44-87b2efc2d8fmr139819516d6.62.1760121368964;
 Fri, 10 Oct 2025 11:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9a0849d8-befd-4fca-9d5d-a24520ccfa26@broadcom.com> <20251009073928.6803-1-gokulkumar.sivakumar@infineon.com>
In-Reply-To: <20251009073928.6803-1-gokulkumar.sivakumar@infineon.com>
From: Richard Reigh <richard@govivid.ai>
Date: Fri, 10 Oct 2025 13:35:58 -0500
X-Gm-Features: AS18NWBGUJE436z4r3vTQjxbi-vU1TJtN7DA6uJIZH9UUqY2OK2qXWOqtkmbYy0
Message-ID: <CAFwtOaU45QEO=1jMsvM9EqbQ8NVYgDnXzV5k2s5xVaZo-z2zVw@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: fix crash while sending
 Action Frames in standalone AP Mode
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: arend.vanspriel@broadcom.com, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, chris@streetlogic.pro, 
	linux-wireless@vger.kernel.org, s311332@gmail.com, wahrenst@gmx.net, 
	wlan-kernel-dev-list@infineon.com, johannes@sipsolutions.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 2:41=E2=80=AFAM Gokul Sivakumar
<gokulkumar.sivakumar@infineon.com> wrote:
>
> Currently, whenever there is a need to transmit an Action frame,
> the brcmfmac driver always uses the P2P vif to send the "actframe" IOVAR =
to
> firmware. The P2P interfaces were available when wpa_supplicant is managi=
ng
> the wlan interface.
>
> However, the P2P interfaces are not created/initialized when only hostapd
> is managing the wlan interface. And if hostapd receives an ANQP Query REQ
> Action frame even from an un-associated STA, the brcmfmac driver tries
> to use an uninitialized P2P vif pointer for sending the IOVAR to firmware=
.
> This NULL pointer dereferencing triggers a driver crash.
>
>  [ 1417.074538] Unable to handle kernel NULL pointer dereference at virtu=
al
>  address 0000000000000000
>  [...]
>  [ 1417.075188] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
>  [...]
>  [ 1417.075653] Call trace:
>  [ 1417.075662]  brcmf_p2p_send_action_frame+0x23c/0xc58 [brcmfmac]
>  [ 1417.075738]  brcmf_cfg80211_mgmt_tx+0x304/0x5c0 [brcmfmac]
>  [ 1417.075810]  cfg80211_mlme_mgmt_tx+0x1b0/0x428 [cfg80211]
>  [ 1417.076067]  nl80211_tx_mgmt+0x238/0x388 [cfg80211]
>  [ 1417.076281]  genl_family_rcv_msg_doit+0xe0/0x158
>  [ 1417.076302]  genl_rcv_msg+0x220/0x2a0
>  [ 1417.076317]  netlink_rcv_skb+0x68/0x140
>  [ 1417.076330]  genl_rcv+0x40/0x60
>  [ 1417.076343]  netlink_unicast+0x330/0x3b8
>  [ 1417.076357]  netlink_sendmsg+0x19c/0x3f8
>  [ 1417.076370]  __sock_sendmsg+0x64/0xc0
>  [ 1417.076391]  ____sys_sendmsg+0x268/0x2a0
>  [ 1417.076408]  ___sys_sendmsg+0xb8/0x118
>  [ 1417.076427]  __sys_sendmsg+0x90/0xf8
>  [ 1417.076445]  __arm64_sys_sendmsg+0x2c/0x40
>  [ 1417.076465]  invoke_syscall+0x50/0x120
>  [ 1417.076486]  el0_svc_common.constprop.0+0x48/0xf0
>  [ 1417.076506]  do_el0_svc+0x24/0x38
>  [ 1417.076525]  el0_svc+0x30/0x100
>  [ 1417.076548]  el0t_64_sync_handler+0x100/0x130
>  [ 1417.076569]  el0t_64_sync+0x190/0x198
>  [ 1417.076589] Code: f9401e80 aa1603e2 f9403be1 5280e483 (f9400000)
>
> Fix this, by always using the vif corresponding to the wdev on which the
> Action frame Transmission request was initiated by the userspace. This wa=
y,
> even if P2P vif is not available, the IOVAR is sent to firmware on AP vif
> and the ANQP Query RESP Action frame is transmitted without crashing the
> driver.
>
> Remove init_completion() for "send_af_done" from brcmf_p2p_create_p2pdev(=
)
> and do it in brcmf_p2p_tx_action_frame() instead of reinit_completion().
> Because the formar function would not get executed when hostapd is managi=
ng
> wlan interface, and so it is not safe to do reinit_completion() without a=
ny
> prior init_completion().
>
> And in the brcmf_p2p_tx_action_frame() function, the condition check for
> P2P Presence response frame is not needed, since the wpa_supplicant is
> properly sending the P2P Presense Response frame on the P2P-GO vif instea=
d
> of the P2P-Device vif.
>
> Fixes: 18e2f61db3b7 ("brcmfmac: P2P action frame tx.")
> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |  3 +-
>  .../broadcom/brcm80211/brcmfmac/p2p.c         | 28 ++++++-------------
>  .../broadcom/brcm80211/brcmfmac/p2p.h         |  3 +-
>  3 files changed, 11 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c =
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index 8afaffe31031..bb96b87b2a6e 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -5627,8 +5627,7 @@ brcmf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct =
wireless_dev *wdev,
>                           *cookie, le16_to_cpu(action_frame->len),
>                           le32_to_cpu(af_params->channel));
>
> -               ack =3D brcmf_p2p_send_action_frame(cfg, cfg_to_ndev(cfg)=
,
> -                                                 af_params);
> +               ack =3D brcmf_p2p_send_action_frame(vif->ifp, af_params);
>
>                 cfg80211_mgmt_tx_status(wdev, *cookie, buf, len, ack,
>                                         GFP_KERNEL);
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/dri=
vers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> index 0dc9d28cd77b..c7c40dc3be08 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> @@ -1529,6 +1529,7 @@ int brcmf_p2p_notify_action_tx_complete(struct brcm=
f_if *ifp,
>  /**
>   * brcmf_p2p_tx_action_frame() - send action frame over fil.
>   *
> + * @ifp: interface to transmit on.
>   * @p2p: p2p info struct for vif.
>   * @af_params: action frame data/info.
>   *
> @@ -1538,28 +1539,20 @@ int brcmf_p2p_notify_action_tx_complete(struct br=
cmf_if *ifp,
>   * The WLC_E_ACTION_FRAME_COMPLETE event will be received when the actio=
n
>   * frame is transmitted.
>   */
> -static s32 brcmf_p2p_tx_action_frame(struct brcmf_p2p_info *p2p,
> +static s32 brcmf_p2p_tx_action_frame(struct brcmf_if *ifp,
> +                                    struct brcmf_p2p_info *p2p,
>                                      struct brcmf_fil_af_params_le *af_pa=
rams)
>  {
>         struct brcmf_pub *drvr =3D p2p->cfg->pub;
> -       struct brcmf_cfg80211_vif *vif;
> -       struct brcmf_p2p_action_frame *p2p_af;
>         s32 err =3D 0;
>
>         brcmf_dbg(TRACE, "Enter\n");
>
> -       reinit_completion(&p2p->send_af_done);
> +       init_completion(&p2p->send_af_done);
>         clear_bit(BRCMF_P2P_STATUS_ACTION_TX_COMPLETED, &p2p->status);
>         clear_bit(BRCMF_P2P_STATUS_ACTION_TX_NOACK, &p2p->status);
>
> -       /* check if it is a p2p_presence response */
> -       p2p_af =3D (struct brcmf_p2p_action_frame *)af_params->action_fra=
me.data;
> -       if (p2p_af->subtype =3D=3D P2P_AF_PRESENCE_RSP)
> -               vif =3D p2p->bss_idx[P2PAPI_BSSCFG_CONNECTION].vif;
> -       else
> -               vif =3D p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
> -
> -       err =3D brcmf_fil_bsscfg_data_set(vif->ifp, "actframe", af_params=
,
> +       err =3D brcmf_fil_bsscfg_data_set(ifp, "actframe", af_params,
>                                         sizeof(*af_params));
>         if (err) {
>                 bphy_err(drvr, " sending action frame has failed\n");
> @@ -1711,16 +1704,14 @@ static bool brcmf_p2p_check_dwell_overflow(u32 re=
quested_dwell,
>  /**
>   * brcmf_p2p_send_action_frame() - send action frame .
>   *
> - * @cfg: driver private data for cfg80211 interface.
> - * @ndev: net device to transmit on.
> + * @ifp: interface to transmit on.
>   * @af_params: configuration data for action frame.
>   */
> -bool brcmf_p2p_send_action_frame(struct brcmf_cfg80211_info *cfg,
> -                                struct net_device *ndev,
> +bool brcmf_p2p_send_action_frame(struct brcmf_if *ifp,
>                                  struct brcmf_fil_af_params_le *af_params=
)
>  {
> +       struct brcmf_cfg80211_info *cfg =3D ifp->drvr->config;
>         struct brcmf_p2p_info *p2p =3D &cfg->p2p;
> -       struct brcmf_if *ifp =3D netdev_priv(ndev);
>         struct brcmf_fil_action_frame_le *action_frame;
>         struct brcmf_config_af_params config_af_params;
>         struct afx_hdl *afx_hdl =3D &p2p->afx_hdl;
> @@ -1857,7 +1848,7 @@ bool brcmf_p2p_send_action_frame(struct brcmf_cfg80=
211_info *cfg,
>                 if (af_params->channel)
>                         msleep(P2P_AF_RETRY_DELAY_TIME);
>
> -               ack =3D !brcmf_p2p_tx_action_frame(p2p, af_params);
> +               ack =3D !brcmf_p2p_tx_action_frame(ifp, p2p, af_params);
>                 tx_retry++;
>                 dwell_overflow =3D brcmf_p2p_check_dwell_overflow(request=
ed_dwell,
>                                                                 dwell_jif=
fies);
> @@ -2217,7 +2208,6 @@ static struct wireless_dev *brcmf_p2p_create_p2pdev=
(struct brcmf_p2p_info *p2p,
>
>         WARN_ON(p2p_ifp->bsscfgidx !=3D bsscfgidx);
>
> -       init_completion(&p2p->send_af_done);
>         INIT_WORK(&p2p->afx_hdl.afx_work, brcmf_p2p_afx_handler);
>         init_completion(&p2p->afx_hdl.act_frm_scan);
>         init_completion(&p2p->wait_next_af);
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.h b/dri=
vers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.h
> index d2ecee565bf2..d3137ebd7158 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.h
> @@ -168,8 +168,7 @@ int brcmf_p2p_notify_action_frame_rx(struct brcmf_if =
*ifp,
>  int brcmf_p2p_notify_action_tx_complete(struct brcmf_if *ifp,
>                                         const struct brcmf_event_msg *e,
>                                         void *data);
> -bool brcmf_p2p_send_action_frame(struct brcmf_cfg80211_info *cfg,
> -                                struct net_device *ndev,
> +bool brcmf_p2p_send_action_frame(struct brcmf_if *ifp,
>                                  struct brcmf_fil_af_params_le *af_params=
);
>  bool brcmf_p2p_scan_finding_common_channel(struct brcmf_cfg80211_info *c=
fg,
>                                            struct brcmf_bss_info_le *bi);
>
> base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
> --
> 2.25.1


Hi Gokul,

I tested your patch on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+
and can confirm it fixes the crash. The iPhone now successfully
queries network information without causing a NULL pointer
dereference.

Tested-by: Richard Reigh <richard@govivid.ai>

Best regards,
Richard
